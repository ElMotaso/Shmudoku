

func solve(grid: [[Int]], initialSolve: Bool = false) -> [[Int]] {
    solverCount += 1
    if solverCount > 100 && initialSolve {
        return [[]]
    }
    // Check if the puzzle has been solved

    // Find the next empty cell
    for i in 0..<9 {
        for j in 0..<9 {
            if grid[i][j] != -1 {
                continue
            }
            for digit in 1...9 {
                if isValid(grid: grid, row: i, column: j, number: digit) {
                    var newGrid = grid
                    newGrid[i][j] = digit
                    newGrid = solve(grid: newGrid, initialSolve: initialSolve)
                    if isValidSudoku(grid: newGrid) {
                        return newGrid
                    }
                }
                else if digit == 9 {
                    return [[]]
                }
            }
            if grid[i][j] == -1 {
                return [[]]
            }
        }
    }

    if isValidFinishedSudoku(grid: grid) {
        return grid
    }
    return [[]]
}




func solveReverse(grid: [[Int]]) -> [[Int]] {
    // Check if the puzzle has been solved
    if !grid.contains(where: { $0.contains(-1) }) {
        return grid
    }

    // Find the next empty cell
    let row = grid.firstIndex(where: { $0.contains(-1) })!
    let column = grid[row].firstIndex(of: -1)!

    // Try each possible digit in the empty cell
    for digit in stride(from: 9, to: 1, by: -1) {
        // Check if the digit is valid in the current cell
        if isValid(grid: grid, row: row, column: column, number: digit) {
            // Try solving the puzzle with the current digit
            var newGrid = grid
            newGrid[row][column] = digit
            let result = solve(grid: newGrid)
            if result != [[]] {
                return result
            }
        }
    }

    // Return an empty grid if the puzzle has no solution
    return [[]]
}


func ggiveNumberOfSolution(grid: [[Int]]) -> Int {
    
    // Check if the puzzle is already solved
    if !grid.contains(where: { $0.contains(-1) }) {
        return 1
    }
    if solve(grid: grid) == [[]] {
        return 0
    }
    if solve(grid: grid) == mirrorGrid(grid: solveReverse(grid: mirrorGrid(grid: grid))) {
        return 1
    }
    return 2
    
}


func mirrorGrid(grid: [[Int]]) -> [[Int]] {
    if grid == [[]] {
        return grid
    }
    var mirroredGrid: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: 9), count: 9)
    
    for row in 0..<9 {
        for column in 0..<9 {
            mirroredGrid[row][column] = grid[8 - row][8 - column]
        }
    }
    return mirroredGrid
}












func onlyOneLeft(grid: [[Int]]) -> [[Int]] {
    
    for row in 0...8 {
        for column in 0...8 {
            if grid[row][column] == -1 {
                let _ = getPossibleNumbers(row: row, column: column, grid: grid)
                
            }
        }
    }
    return grid
}




func numberOfSolutions(row: Int = 0, column: Int = 0, grid: [[Int]], counter: Int = 0) -> Int{
    solverCount += 1
    var i = row
    var j = column
    var cells = grid
    var count = counter
    if (i == 9) {
        i = 0
        j += 1
        if (j == 9) {
            return count + 1
        }
    }
    if (cells[i][j] != -1) { // skip filled cells
        return numberOfSolutions(row: i + 1, column: j, grid: cells, counter: count)
    }
    // search for 2 solutions instead of 1
    // break, if 2 solutions are found
    //for (int val = 1; val <= 9 && count < 2; ++val) {
    for val in 1...9 {
        if count >= 2 {
            break
        }
        if getPossibleNumbers(row: i, column: j, grid: cells).contains(val) {
            cells[i][j] = val
            // add additional solutions
            count = numberOfSolutions(row: i+1, column: j, grid: cells, counter: count)
        }
    }
    cells[i][j] = -1 // reset on backtrack
    return count
}
