import SwiftUI
import Foundation


struct ButtonGridView: View {
    let persistenceController = PersistenceController.shared
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var sudoku: Sudoku
    @Binding var storedNumber: Int
    @Binding var commentMode: Bool
    @Binding var errorMode: Bool

    @State var finished = false

    var body: some View {
        GeometryReader { geometry in
            let fontSize = 24.0
            let size = geometry.size.height
            //print("buttons \(geometry.size.height)")
            let gridVPosition = size / 2
            let gridHPosition = geometry.size.width / 2
            
            //let gridSize = geometry.size.width * (ratioSize - 1) / ratioSize
            let cellSize = geometry.size.width / 8
            
            let borderColor = colorScheme == .dark ? Color.white : Color.black
            let borderWidth = 0.5
            
            
            
            VStack {
                ForEach(0..<9, id: \.self) { row in
                    HStack {
                        ForEach(0..<9, id: \.self) { column in
                            // Given Clues of Sudoku
                            if sudoku.initialGrid[row][column] != -1 {
                                Text("\(sudoku.initialGrid[row][column])")
                                    .frame(width: cellSize - 8, height: cellSize - 8)
                                    .font(.custom("CourierNewPS-BoldMT", size: fontSize))
                                    .border(borderColor, width: borderWidth)
                            }
                            else {
                                //Initially empty Cells
                                Button(action: {
                                    //Add Comment
                                    if commentMode {
                                        if storedNumber != -1 {
                                            sudoku.addComment(row: row, column: column, digit: storedNumber)
                                            UserDefaults.standard.set(sudoku.commentGrid, forKey: "commentGrid")
                                        }
                                        else {
                                            sudoku.resetComment(row: row, column: column)
                                            UserDefaults.standard.set(sudoku.commentGrid, forKey: "commentGrid")
                                        }
                                    }
                                    //Add Number
                                    else {
                                        sudoku.addNumber(row: row, column: column, digit: storedNumber)
                                        sudoku.resetComment(row: row, column: column)
                                        sudoku.removeComments(row: row, column: column, digit: storedNumber)
                                        finished = sudoku.checkIfFinished()
                                        UserDefaults.standard.set(sudoku.workingGrid, forKey: "workingGrid")
                                        UserDefaults.standard.set(sudoku.commentGrid, forKey: "commentGrid")
                                    }
                                }) {
                                    //Show Comments
                                    if sudoku.workingGrid[row][column] == -1 {
                                        let possibleNumbers = getPossibleNumbers(row: row, column: column, grid: sudoku.workingGrid)
                                        CommentView(sudoku: sudoku, cellSize: Double(cellSize/8) - 1, fontSize: fontSize / 2.5, row: row, column: column, possibleNumbers: possibleNumbers)
                                        .frame(width: cellSize - 8, height: cellSize - 8)
                                        
                                    }
                                    else {
                                        Text("\(sudoku.workingGrid[row][column])")
                                                .frame(width: cellSize - 8, height: cellSize - 8)
                                                .foregroundColor((!isValid(grid: sudoku.solvedGrid, row: row, column: column, number: sudoku.workingGrid[row][column]) && errorMode) ? Color.red : Color.blue)
                                                .font(.custom("CourierNewPS-BoldMT", size: fontSize))
                                        
                                    }
                                    
                                }
                                .border(borderColor, width: borderWidth)
                            }
                        }
                        .padding(-4.5)
                    }
                }
                Spacer()
            }
            .position(x: gridHPosition, y: gridVPosition)
            .alert("Time: \(secondsToHoursMinutesSeconds(seconds: sudoku.secondsElapsed))\nMistakes: \(sudoku.errorCounter)", isPresented: $finished) {
                        Button("New", role: .cancel) { }
                Button("Share", role: .cancel) {}
                    }
            HStack {
                Spacer()
                Text("Shmudoku Number: \(sudoku.seed)")
                    //.position(x: gridHPosition, y: gridVPosition * 1.05)
                    .font(.custom("CourierNewPS-BoldMT", size: fontSize / 2))
                    .foregroundColor(Color.gray)
                    //.padding(.horizontal, (geometry.size.width - gridSize)/2)
                    .padding(.top, gridVPosition * 1.1 )
            }
        }
    }
}

