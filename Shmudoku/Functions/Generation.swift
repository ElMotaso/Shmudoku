import Foundation

var solverCount = 0


func generate() -> [[[Int]]]{
    print("start")
    
    var initalGrid: [[Int]] = [[]]
    var solvedGrid: [[Int]] = [[]]
    while solvedGrid == [[]] {
        solverCount = 0
        initalGrid = [[Int]](repeating: [Int](repeating: -1, count: 9), count: 9)
        for _ in 0..<17 {
            let row = Int.random(in: 0..<9)
            let column = Int.random(in: 0..<9)
            let possibleNumbers = getPossibleNumbers(row: row, column: column, grid: initalGrid)
            let digit = possibleNumbers.randomElement()
            initalGrid[row][column] = digit ?? -1
        }
        solvedGrid = solve(grid: initalGrid, initialSolve: true)
    }
    print(solverCount)
    initalGrid = removeDigits(grid: solvedGrid)
    //initalGrid = addDigits(initialGrid: initalGrid, solvedGrid: solvedGrid)
    
    print(solverCount)
    solverCount = 0
    while countClues(grid: initalGrid) > 35 {
        print("clues: \(countClues(grid: initalGrid))")
        initalGrid = removeDigits(grid: solvedGrid)
    }
    print("clues: \(countClues(grid: initalGrid))")
    
    let grids = shuffleGrids(grids: [initalGrid, initalGrid, solvedGrid])
    
    
    
    return grids
    //grid = removeDigits(grid: grid)
    //print(solverCount)
    //print(countClues(grid: grid))
    //return grid
}


func initializeSudoku() -> [[[Int]]] {
    let initalGrid: [[Int]] = UserDefaults.standard.object(forKey: "initialGrid") as? [[Int]] ?? [[Int]]([[]])
    let workingGrid: [[Int]] = UserDefaults.standard.object(forKey: "workingGrid") as? [[Int]] ?? [[Int]]([[]])
    let solvedGrid: [[Int]] = UserDefaults.standard.object(forKey: "solvedGrid") as? [[Int]] ?? [[Int]]([[]])
    
    let secondsElapsed = UserDefaults.standard.integer(forKey: "secondsElapsed")
    
    if initalGrid == [[]] || workingGrid == [[]] || solvedGrid == [[]] || secondsElapsed == 0 {
        return generate()
    }
    
    return [initalGrid, workingGrid, solvedGrid]
}

func addDigits(initialGrid: [[Int]], solvedGrid: [[Int]]) -> [[Int]] {
    var solutions = 2
    var iteration = 1
    var testGrid = initialGrid
    while solutions > 1 {
        print("iteration: \(iteration), clues: \(countClues(grid: testGrid))")
        iteration += 1
        var row = Int.random(in: 0..<9)
        var column = Int.random(in: 0..<9)
        while testGrid[row][column] != -1 {
            row = Int.random(in: 0..<9)
            column = Int.random(in: 0..<9)
        }
        
        testGrid[row][column] = solvedGrid[row][column]
        
        solutions = numberOfSolutions(grid: testGrid)
        print("  number of solutions: \(solutions)")
        
        if solutions == 0 {
            print("better luck next time")
            testGrid = initialGrid
        }
        if solutions == 1 {
            return testGrid
        }
    }
    return [[Int]](repeating: [Int](repeating: 9, count: 9), count: 9)
}


func isValid(grid: [[Int]], row: Int, column: Int, number: Int) -> Bool {
    if grid == [[]] {
        return false
    }
    return getPossibleNumbers(row: row, column: column, grid: grid).contains(number)
}


func isValidFinishedSudoku(grid: [[Int]]) -> Bool {
    if grid == [[]] {
        return false
    }
    // Check all rows
    for i in 0..<9 {
        for j in 0..<9 {
            if grid[i][j] != -1 && !isValid(grid: grid, row: i, column: j, number: grid[i][j]) {
                return false
            }
            
        }
        
    }
    return true
}


func isValidSudoku(grid: [[Int]]) -> Bool {
    if grid == [[]] {
        return false
    }
    // Check all rows
    for i in 0..<9 {
        for j in 0..<9 {
            if !isValid(grid: grid, row: i, column: j, number: grid[i][j]) {
                return false
            }
            
        }
        
    }
    return true
}


func getPossibleNumbers(row: Int, column: Int, grid: [[Int]]) -> [Int] {
    // Get the list of all possible numbers
    var possibleNumbers = [Int](1...9)
    // Get the list of used numbers in the row, column, and 3x3 box
    var usedNumbers = [Int]()

    // Add the numbers in the row to the list of used numbers
    for i in 0..<9 {
        if i != column { // exclude the given cell from the list of used numbers
            usedNumbers.append(grid[row][i])
        }
    }
    // Add the numbers in the column to the list of used numbers
    for i in 0..<9 {
        if i != row { // exclude the given cell from the list of used numbers
            usedNumbers.append(grid[i][column])
        }
    }

    // Add the numbers in the 3x3 box to the list of used numbers
    let boxX = row / 3
    let boxY = column / 3
    for i in 0..<3 {
        for j in 0..<3 {
            let subRow = boxX * 3 + i
            let subColumn = boxY * 3 + j
            if row == subRow && column == subColumn {
                continue
                
            }
            usedNumbers.append(grid[subRow][subColumn])
        }
    }

    // Filter out the used numbers from the list of possible numbers
    possibleNumbers = possibleNumbers.filter { !usedNumbers.contains(Int($0)) }
    var possibleArray: [Int] = []
    for number in possibleNumbers {
        possibleArray.append(number)
    }
    return possibleArray
}


func removeDigits(grid: [[Int]]) -> [[Int]] {
    if numberOfSolutions(grid: grid) != 1 {
        return [[]]
    }
    var newGrid = removeRandomDigits(grid: grid)
    return newGrid
    
    for row in 0..<9 {
        for column in 0..<9 {
            if newGrid[row][column] == -1 {
                continue
            }
            let digit = newGrid[row][column]
            newGrid[row][column] = -1
            if numberOfSolutions(grid: newGrid) != 1 {
                newGrid[row][column] = digit
            }
            
        }
    }
    return newGrid
}


func removeRandomDigits(grid: [[Int]]) -> [[Int]]{
    var row = Int.random(in: 0..<9)
    var column = Int.random(in: 0..<9)
    while grid[row][column] == -1 {
        row = Int.random(in: 0..<9)
        column = Int.random(in: 0..<9)
    }
    var newGrid = grid
    newGrid[row][column] = -1
    let result = numberOfSolutions(grid: newGrid)
    if result == 1  {
        newGrid = removeRandomDigits(grid: newGrid)
        return newGrid
    }
    return grid
}




