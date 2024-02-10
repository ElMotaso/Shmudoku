import SwiftUI
import Foundation

class Sudoku: ObservableObject {
    // properties of the Sudoku class
    @Published var initialGrid: [[Int]]
    @Published var workingGrid: [[Int]]
    @Published var solvedGrid: [[Int]]
    @Published var commentGrid: [[[[Bool]]]]
    @Published var secondsElapsed: Int
    @Published var timer: Timer?
    @Published var errorCounter: Int
    @Published var seed: String
    
    // initializer for the Sudoku class
    init() {
        let grids = initMedium()
        self.initialGrid = UserDefaults.standard.object(forKey: "initialGrid") as? [[Int]] ?? grids.0
        self.workingGrid = UserDefaults.standard.object(forKey: "workingGrid") as? [[Int]] ?? grids.1
        self.solvedGrid = UserDefaults.standard.object(forKey: "solvedGrid") as? [[Int]] ?? grids.2
        self.seed = UserDefaults.standard.string(forKey: "seed") ?? grids.3
        self.commentGrid = UserDefaults.standard.object(forKey: "commentGrid") as? [[[[Bool]]]] ?? [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3), count: 9), count: 9)
        self.secondsElapsed = UserDefaults.standard.integer(forKey: "secondsElapsed")
        self.errorCounter = UserDefaults.standard.integer(forKey: "errorCounter")
        
        UserDefaults.standard.set(self.initialGrid, forKey: "initialGrid")
        UserDefaults.standard.set(self.workingGrid, forKey: "workingGrid")
        UserDefaults.standard.set(self.solvedGrid, forKey: "solvedGrid")
        UserDefaults.standard.set(self.commentGrid, forKey: "commentGrid")
        UserDefaults.standard.set(self.secondsElapsed, forKey: "secondsElapsed")
        UserDefaults.standard.set(self.errorCounter, forKey: "errorCounter")
        UserDefaults.standard.set(self.seed, forKey: "seed")
    }
    
    
    
    
    func generateSudoku(difficulty: Int, seed: Int = 0){
        if seed != 0 {
            
        }
        let grids = initDifficulty(difficulty: difficulty)
        self.initialGrid = grids.0
        self.workingGrid = grids.1
        self.solvedGrid = grids.2
        self.seed = grids.3
        self.commentGrid = [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3), count: 9), count: 9)
        self.secondsElapsed = 0
        self.errorCounter = 0
        
        UserDefaults.standard.set(self.initialGrid, forKey: "initialGrid")
        UserDefaults.standard.set(self.workingGrid, forKey: "workingGrid")
        UserDefaults.standard.set(self.solvedGrid, forKey: "solvedGrid")
        UserDefaults.standard.set(self.commentGrid, forKey: "commentGrid")
        UserDefaults.standard.set(self.secondsElapsed, forKey: "secondsElapsed")
        UserDefaults.standard.set(self.errorCounter, forKey: "errorCounter")
        UserDefaults.standard.set(self.seed, forKey: "seed")
    }
    
    func newSudoku(difficulty: Int = 1){
        generateSudoku(difficulty: difficulty)
        restartTimer()
    }
    
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
            UserDefaults.standard.set(self.secondsElapsed, forKey: "secondsElapsed")
        }
    }
    
    
    func stopTimer(){
        self.timer?.invalidate()
    }
    
    
    func restartTimer(){
        stopTimer()
        startTimer()
    }
    
    
    func addNumber(row: Int, column: Int, digit: Int){
        if digit != -1 && self.solvedGrid[row][column] != digit && digit != self.workingGrid[row][column] {
            self.errorCounter += 1
        }
        if self.workingGrid[row][column] != digit {
            self.workingGrid[row][column] = digit
        }
        else {
            self.workingGrid[row][column] = -1
        }
        UserDefaults.standard.set(self.workingGrid, forKey: "workingGrid")
        UserDefaults.standard.set(self.errorCounter, forKey: "errorCounter")
    }
    
    
    func addComment(row: Int, column: Int, digit: Int) {
        let subrow = self.digitToX(digit: digit - 1)
        let subcolumn = self.digitToY(digit: digit - 1)
        self.commentGrid[row][column][subrow][subcolumn].toggle()
        UserDefaults.standard.set(self.commentGrid, forKey: "commentGrid")
    }
    
    func resetComment(row: Int, column: Int){
        self.commentGrid[row][column] = [[Bool]](repeating:
                                                    [Bool](repeating: false,
                                                           count: 3),
                                                 count: 3)
        UserDefaults.standard.set(self.commentGrid, forKey: "commentGrid")
    }
    
    func removeComments(row: Int, column: Int, digit: Int){
        if digit == -1 {
            return
        }
        // Add the numbers in the row to the list of used numbers
        for i in 0..<9 {
            
            self.commentGrid[i][column][digitToX(digit: digit - 1)][digitToY(digit: digit - 1)] = false
        }
        
        // Add the numbers in the column to the list of used numbers
        for i in 0..<9 {
            self.commentGrid[row][i][digitToX(digit: digit - 1)][digitToY(digit: digit - 1)] = false
        }
        
        // Add the numbers in the 3x3 box to the list of used numbers
        let boxX = row / 3
        let boxY = column / 3
        for i in 0..<3 {
            for j in 0..<3 {
                let k = boxX * 3 + i
                let l = boxY * 3 + j
                self.commentGrid[k][l][digitToX(digit: digit - 1)][digitToY(digit: digit - 1)] = false
            }
        }
        UserDefaults.standard.set(self.commentGrid, forKey: "commentGrid")
    }
    
    func digitToY(digit: Int) -> Int {
        return digit % 3
    }
    
    func digitToX(digit: Int) -> Int{
        return digit / 3
    }
    
    func checkIfFinished() -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if self.workingGrid[i][j] != self.solvedGrid[i][j] {
                    return false
                }
            }
        }
        self.stopTimer()
        return true
    }
    
    
    func finishedDigits() -> [Bool] {
        var digits = [Int](repeating: 0, count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                if  self.workingGrid[i][j] != -1 {
                    digits[self.workingGrid[i][j] - 1] += 1
                }
            }
        }
        var finishedDigits: [Bool] = []
        for digit in digits {
            finishedDigits.append(digit >= 9)
        }
        return finishedDigits
    }
    
    
}



