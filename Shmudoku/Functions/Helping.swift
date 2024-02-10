
func shuffleGrid(grid: inout [[Int]]) {
    let shuffledNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    
    for i in 0..<9 {
      for j in 0..<9 {
          if grid[i][j] != -1{
              grid[i][j] = shuffledNumbers[grid[i][j] - 1]
        }
      }
    }
}

func shuffleGrids(grids: [[[Int]]]) -> [[[Int]]]{
    let shuffledNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    
    var shuffledGrids = grids
    
    for i in 0..<grids.count {
        for j in 0..<9 {
            for k in 0..<9{
                if grids[i][j][k] != -1 {
                    shuffledGrids[i][j][k] = shuffledNumbers[grids[i][j][k] - 1]
                }
            }
            
        }
    }
    return shuffledGrids
}


func countClues(grid: [[Int]]) -> Int {
    var count = 0
    for i in 0..<9 {
        for j in 0..<9 {
            if grid[i][j] != -1 {
                count += 1
            }
        }
    }
    return count
}
