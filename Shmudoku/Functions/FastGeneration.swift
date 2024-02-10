func initDifficulty(difficulty: Int) -> ([[Int]], [[Int]], [[Int]], String) {
    switch difficulty {
    case 0:
        return initEasy()

    case 1:
        return initMedium()

    case 2:
        return initHard()
    case 3:
        return initEvil()
    default:
        return initMedium()
    }
}


func initEvil() -> ([[Int]], [[Int]], [[Int]], String) {
    let initialGrids = [
                    [
                    [0, 1, 5, 8, 0, 4, 9, 0, 0],
                    [0, 0, 4, 0, 5, 0, 0, 0, 0],
                    [0, 0, 0, 0, 2, 0, 0, 0, 8],
                    [0, 0, 3, 4, 0, 9, 0, 0, 6],
                    [0, 2, 0, 0, 0, 0, 0, 3, 0],
                    [0, 0, 0, 0, 0, 5, 0, 0, 0],
                    [0, 0, 0, 0, 8, 0, 0, 0, 0],
                    [7, 0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 2, 6, 0, 3, 0, 0, 9]
                    ],
                    [
                    [0, 0, 0, 8, 0, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 4, 3],
                    [5, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 7, 0, 8, 0, 0],
                    [0, 0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 2, 0, 0, 3, 0, 0, 0, 0],
                    [6, 0, 0, 0, 0, 0, 0, 7, 5],
                    [0, 0, 3, 4, 0, 0, 0, 0, 0],
                    [0, 0, 0, 2, 0, 0, 6, 0, 0]
                    ],
                    [
                    [2, 0, 7, 0, 0, 0, 0, 0, 0],
                    [6, 0, 0, 1, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 8, 0, 4, 0, 0],
                    [5, 0, 0, 2, 0, 0, 0, 0, 6],
                    [0, 8, 0, 0, 4, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1, 0],
                    [3, 0, 0, 6, 0, 0, 0, 0, 0],
                    [0, 9, 0, 0, 0, 0, 8, 0, 0],
                    [0, 0, 0, 7, 0, 0, 0, 0, 0]
                    ]
                ]
    let solvedGrids = [
            [
                [3, 1, 5, 8, 7, 4, 9, 6, 2],
                [2, 8, 4, 9, 5, 6, 3, 1, 7],
                [6, 9, 7, 3, 2, 1, 4, 5, 8],
                [5, 7, 3, 4, 1, 9, 2, 8, 6],
                [9, 2, 1, 7, 6, 8, 5, 3, 4],
                [8, 4, 6, 2, 3, 5, 7, 9, 1],
                [4, 3, 9, 1, 8, 7, 6, 2, 5],
                [7, 6, 8, 5, 9, 2, 1, 4, 3],
                [1, 5, 2, 6, 4, 3, 8, 7, 9]
            ],
            [
                [2, 3, 7, 8, 4, 1, 5, 6, 9],
                [1, 8, 6, 7, 9, 5, 2, 4, 3],
                [5, 9, 4, 3, 2, 6, 7, 1, 8],
                [3, 1, 5, 6, 7, 4, 8, 9, 2],
                [4, 6, 9, 5, 8, 2, 1, 3, 7],
                [7, 2, 8, 1, 3, 9, 4, 5, 6],
                [6, 4, 2, 9, 1, 8, 3, 7, 5],
                [8, 5, 3, 4, 6, 7, 9, 2, 1],
                [9, 7, 1, 2, 5, 3, 6, 8, 4]
            ],
            [
                [2, 5, 7, 4, 6, 3, 1, 9, 8],
                [6, 4, 8, 1, 7, 9, 3, 2, 5],
                [9, 1, 3, 5, 8, 2, 4, 6, 7],
                [5, 3, 4, 2, 1, 7, 9, 8, 6],
                [1, 8, 2, 9, 4, 6, 7, 5, 3],
                [7, 6, 9, 8, 3, 5, 2, 1, 4],
                [3, 7, 1, 6, 2, 8, 5, 4, 9],
                [4, 9, 6, 3, 5, 1, 8, 7, 2],
                [8, 2, 5, 7, 9, 4, 6, 3, 1]
            ]
    ]
    
    let randomNumner = [0, 1, 2].randomElement()
    var initialGrid = initialGrids[randomNumner!]
    var solvedGrid = solvedGrids[randomNumner!]
    var seed = "3\(randomNumner ?? 0)"
    
    prepareGrids(initialGrid: &initialGrid, solvedGrid: &solvedGrid, seed: &seed)
    
    print(seed)
    return (initialGrid, initialGrid, solvedGrid, seed)
}

func initHard() -> ([[Int]], [[Int]], [[Int]], String) {
    let initialGrids = [
        [
            [2, 0, 0, 0, 0, 0, 6, 0, 0],
            [7, 4, 0, 0, 0, 0, 0, 0, 0],
            [0, 3, 6, 0, 0, 0, 0, 4, 0],
            [0, 0, 0, 0, 1, 8, 0, 5, 3],
            [0, 0, 5, 2, 4, 3, 7, 0, 0],
            [8, 6, 0, 5, 9, 0, 0, 0, 0],
            [0, 9, 0, 0, 0, 0, 8, 3, 0],
            [0, 0, 0, 0, 0, 0, 0, 2, 4],
            [0, 0, 7, 0, 0, 0, 0, 0, 6]
        ],
        [
            [0, 8, 1, 4, 9, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 2, 0, 0, 0],
            [2, 0, 4, 0, 0, 0, 0, 0, 1],
            [0, 2, 6, 0, 5, 0, 8, 0, 0],
            [4, 0, 0, 0, 0, 0, 0, 0, 5],
            [0, 0, 3, 0, 2, 0, 6, 7, 0],
            [5, 0, 0, 0, 0, 0, 9, 0, 8],
            [0, 0, 0, 9, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 6, 5, 7, 2, 0]
        ],
        [
            [0, 0, 5, 0, 0, 3, 0, 0, 0],
            [0, 0, 0, 6, 5, 0, 0, 4, 0],
            [0, 0, 7, 2, 4, 0, 5, 0, 1],
            [0, 0, 3, 0, 0, 4, 0, 0, 5],
            [0, 0, 6, 0, 0, 0, 2, 0, 0],
            [7, 0, 0, 1, 0, 0, 4, 0, 0],
            [5, 0, 2, 0, 6, 8, 3, 0, 0],
            [0, 3, 0, 0, 9, 2, 0, 0, 0],
            [0, 0, 0, 5, 0, 0, 9, 0, 0]
        ]
    ]
    let solvedGrids = [
        [
            [2, 8, 9, 4, 3, 5, 6, 7, 1],
            [7, 4, 1, 9, 2, 6, 3, 8, 5],
            [5, 3, 6, 8, 7, 1, 2, 4, 9],
            [4, 7, 2, 6, 1, 8, 9, 5, 3],
            [9, 1, 5, 2, 4, 3, 7, 6, 8],
            [8, 6, 3, 5, 9, 7, 4, 1, 2],
            [6, 9, 4, 1, 5, 2, 8, 3, 7],
            [3, 5, 8, 7, 6, 9, 1, 2, 4],
            [1, 2, 7, 3, 8, 4, 5, 9, 6]
        ],
        [
            [7, 8, 1, 4, 9, 3, 5, 6, 2],
            [6, 3, 5, 8, 1, 2, 4, 9, 7],
            [2, 9, 4, 5, 7, 6, 3, 8, 1],
            [1, 2, 6, 7, 5, 9, 8, 4, 3],
            [4, 7, 9, 6, 3, 8, 2, 1, 5],
            [8, 5, 3, 1, 2, 4, 6, 7, 9],
            [5, 6, 7, 2, 4, 1, 9, 3, 8],
            [3, 4, 2, 9, 8, 7, 1, 5, 6],
            [9, 1, 8, 3, 6, 5, 7, 2, 4]
        ],
        [
            [9, 4, 5, 8, 1, 3, 6, 7, 2],
            [3, 2, 1, 6, 5, 7, 8, 4, 9],
            [8, 6, 7, 2, 4, 9, 5, 3, 1],
            [2, 8, 3, 9, 7, 4, 1, 6, 5],
            [4, 1, 6, 3, 8, 5, 2, 9, 7],
            [7, 5, 9, 1, 2, 6, 4, 8, 3],
            [5, 9, 2, 7, 6, 8, 3, 1, 4],
            [1, 3, 8, 4, 9, 2, 7, 5, 6],
            [6, 7, 4, 5, 3, 1, 9, 2, 8]
        ]
    ]
    
    let randomNumner = [0, 1, 2].randomElement()
    var initialGrid = initialGrids[randomNumner!]
    var solvedGrid = solvedGrids[randomNumner!]
    var seed = "2\(randomNumner ?? 0)"
    
    prepareGrids(initialGrid: &initialGrid, solvedGrid: &solvedGrid, seed: &seed)
    print(seed)

    return (initialGrid, initialGrid, solvedGrid, seed)
}


func initMedium() -> ([[Int]], [[Int]], [[Int]], String) {
    let initialGrids = [
        [
            [0, 0, 2, 0, 6, 0, 0, 0, 0],
            [7, 0, 6, 8, 0, 0, 1, 0, 0],
            [0, 0, 5, 0, 7, 1, 6, 2, 0],
            [5, 6, 0, 4, 0, 2, 0, 0, 3],
            [0, 0, 0, 0, 0, 0, 0, 0, 0],
            [3, 0, 0, 6, 0, 7, 0, 9, 2],
            [0, 9, 3, 1, 5, 0, 2, 0, 0],
            [0, 0, 7, 0, 0, 9, 8, 0, 1],
            [0, 0, 0, 0, 8, 0, 9, 0, 0]
        ],
        [
            [0, 0, 0, 0, 0, 4, 0, 0, 3],
            [0, 0, 0, 8, 0, 9, 0, 4, 0],
            [1, 4, 0, 0, 0, 0, 0, 5, 7],
            [2, 0, 7, 0, 4, 6, 0, 0, 9],
            [0, 0, 0, 0, 9, 0, 0, 0, 0],
            [5, 0, 0, 1, 7, 0, 8, 0, 4],
            [4, 2, 0, 0, 0, 0, 0, 6, 1],
            [0, 9, 0, 4, 0, 1, 0, 0, 0],
            [6, 0, 0, 3, 0, 0, 0, 0, 0]
        ],
        [
            [0, 0, 8, 1, 0, 0, 3, 7, 0],
            [0, 0, 0, 0, 4, 0, 0, 8, 0],
            [2, 0, 0, 0, 9, 8, 5, 0, 6],
            [8, 0, 4, 0, 6, 0, 0, 0, 3],
            [0, 0, 0, 0, 5, 0, 0, 0, 0],
            [5, 0, 0, 0, 1, 0, 7, 0, 8],
            [1, 0, 9, 5, 7, 0, 0, 0, 2],
            [0, 6, 0, 0, 3, 0, 0, 0, 0],
            [0, 2, 3, 0, 0, 9, 1, 0, 0]
        ]
    ]
    let solvedGrids = [
        [
            [4, 1, 2, 9, 6, 5, 3, 7, 8],
            [7, 3, 6, 8, 2, 4, 1, 5, 9],
            [9, 8, 5, 3, 7, 1, 6, 2, 4],
            [5, 6, 1, 4, 9, 2, 7, 8, 3],
            [2, 7, 9, 5, 3, 8, 4, 1, 6],
            [3, 4, 8, 6, 1, 7, 5, 9, 2],
            [8, 9, 3, 1, 5, 6, 2, 4, 7],
            [6, 5, 7, 2, 4, 9, 8, 3, 1],
            [1, 2, 4, 7, 8, 3, 9, 6, 5]
        ],
        [
            [9, 5, 6, 7, 1, 4, 2, 8, 3],
            [7, 3, 2, 8, 5, 9, 1, 4, 6],
            [1, 4, 8, 6, 3, 2, 9, 5, 7],
            [2, 8, 7, 5, 4, 6, 3, 1, 9],
            [3, 1, 4, 2, 9, 8, 6, 7, 5],
            [5, 6, 9, 1, 7, 3, 8, 2, 4],
            [4, 2, 3, 9, 8, 7, 5, 6, 1],
            [8, 9, 5, 4, 6, 1, 7, 3, 2],
            [6, 7, 1, 3, 2, 5, 4, 9, 8]
        ],
        [
            [6, 9, 8, 1, 2, 5, 3, 7, 4],
            [3, 5, 1, 6, 4, 7, 2, 8, 9],
            [2, 4, 7, 3, 9, 8, 5, 1, 6],
            [8, 1, 4, 7, 6, 2, 9, 5, 3],
            [9, 7, 2, 8, 5, 3, 6, 4, 1],
            [5, 3, 6, 9, 1, 4, 7, 2, 8],
            [1, 8, 9, 5, 7, 6, 4, 3, 2],
            [4, 6, 5, 2, 3, 1, 8, 9, 7],
            [7, 2, 3, 4, 8, 9, 1, 6, 5]
        ]
    ]
    
    let randomNumner = [0, 1, 2].randomElement()
    var initialGrid = initialGrids[randomNumner!]
    var solvedGrid = solvedGrids[randomNumner!]
    var seed = "1\(randomNumner ?? 0)"

    prepareGrids(initialGrid: &initialGrid, solvedGrid: &solvedGrid, seed: &seed)
    print(seed)

    return (initialGrid, initialGrid, solvedGrid, seed)
}


func initEasy() -> ([[Int]], [[Int]], [[Int]], String) {
    let initialGrids = [
        [
            [0, 2, 7, 0, 1, 0, 0, 0, 8],
            [9, 0, 5, 0, 6, 8, 0, 0, 7],
            [0, 8, 4, 0, 0, 0, 3, 0, 0],
            [0, 5, 9, 0, 0, 4, 0, 0, 6],
            [0, 7, 0, 6, 0, 5, 0, 8, 0],
            [3, 0, 0, 7, 0, 0, 9, 4, 0],
            [0, 0, 3, 0, 0, 0, 6, 7, 0],
            [5, 0, 0, 1, 2, 0, 8, 0, 4],
            [7, 0, 0, 0, 4, 0, 5, 9, 0]
        ],
        [
            [5, 1, 0, 3, 0, 0, 0, 0, 0],
            [0, 0, 6, 0, 0, 0, 0, 1, 0],
            [2, 0, 0, 0, 0, 5, 0, 8, 6],
            [0, 6, 2, 1, 5, 0, 4, 0, 8],
            [8, 0, 0, 6, 9, 7, 0, 0, 2],
            [1, 0, 3, 0, 4, 8, 6, 5, 0],
            [6, 5, 0, 9, 0, 0, 0, 0, 7],
            [0, 8, 0, 0, 0, 0, 5, 0, 0],
            [0, 0, 0, 0, 0, 6, 0, 4, 3]
        ],
        [
            [0, 7, 0, 0, 4, 0, 0, 0, 6],
            [0, 0, 1, 0, 9, 0, 0, 2, 7],
            [0, 0, 0, 7, 0, 0, 5, 3, 8],
            [6, 4, 0, 0, 5, 7, 0, 1, 2],
            [5, 0, 0, 0, 0, 0, 0, 0, 3],
            [9, 1, 0, 3, 8, 0, 0, 4, 5],
            [1, 2, 4, 0, 0, 8, 0, 0, 0],
            [3, 5, 0, 0, 6, 0, 7, 0, 0],
            [7, 0, 0, 0, 3, 0, 0, 5, 0]
        ]
    ]
    let solvedGrids = [
        [
            [6, 2, 7, 9, 1, 3, 4, 5, 8],
            [9, 3, 5, 4, 6, 8, 1, 2, 7],
            [1, 8, 4, 5, 7, 2, 3, 6, 9],
            [8, 5, 9, 2, 3, 4, 7, 1, 6],
            [4, 7, 1, 6, 9, 5, 2, 8, 3],
            [3, 6, 2, 7, 8, 1, 9, 4, 5],
            [2, 4, 3, 8, 5, 9, 6, 7, 1],
            [5, 9, 6, 1, 2, 7, 8, 3, 4],
            [7, 1, 8, 3, 4, 6, 5, 9, 2]
        ], [
            [5, 1, 8, 3, 6, 2, 7, 9, 4],
            [4, 3, 6, 8, 7, 9, 2, 1, 5],
            [2, 9, 7, 4, 1, 5, 3, 8, 6],
            [9, 6, 2, 1, 5, 3, 4, 7, 8],
            [8, 4, 5, 6, 9, 7, 1, 3, 2],
            [1, 7, 3, 2, 4, 8, 6, 5, 9],
            [6, 5, 4, 9, 3, 1, 8, 2, 7],
            [3, 8, 9, 7, 2, 4, 5, 6, 1],
            [7, 2, 1, 5, 8, 6, 9, 4, 3]
        ], [
            [2, 7, 5, 8, 4, 3, 1, 9, 6],
            [8, 3, 1, 6, 9, 5, 4, 2, 7],
            [4, 9, 6, 7, 2, 1, 5, 3, 8],
            [6, 4, 3, 9, 5, 7, 8, 1, 2],
            [5, 8, 2, 4, 1, 6, 9, 7, 3],
            [9, 1, 7, 3, 8, 2, 6, 4, 5],
            [1, 2, 4, 5, 7, 8, 3, 6, 9],
            [3, 5, 9, 2, 6, 4, 7, 8, 1],
            [7, 6, 8, 1, 3, 9, 2, 5, 4]
        ]
    ]
    
    let randomNumner = [0, 1, 2].randomElement()
    var initialGrid = initialGrids[randomNumner!]
    var solvedGrid = solvedGrids[randomNumner!]
    var seed = "0\(randomNumner ?? 0)"

    prepareGrids(initialGrid: &initialGrid, solvedGrid: &solvedGrid, seed: &seed)
    print(seed)

    return (initialGrid, initialGrid, solvedGrid, seed)
}



func prepareGrids(initialGrid: inout [[Int]], solvedGrid: inout [[Int]], seed: inout String) {
    var newInit = initialGrid
    var newSolv = solvedGrid
    
    // shuffle rows
    for i in 0..<3 {
        var randomThree = [0, 1, 2]
        shuffleThreeNumbers(numbers: &randomThree, seed: &seed)
        for j in 0..<3 {
            newInit[i * 3 + j] = initialGrid[i * 3 + (j + randomThree[i]) % 3]
            newSolv[i * 3 + j] =  solvedGrid[i * 3 + (j + randomThree[i]) % 3]
        }
    }
    
    initialGrid = newInit
    solvedGrid = newSolv
    
    // shuffle columns
    var randomThrees = [[0, 1, 2], [0, 1, 2], [0, 1, 2]]
    for i in 0..<3 {
        shuffleThreeNumbers(numbers: &randomThrees[i], seed: &seed)
    }
    for i in 0..<9 {
        for j in 0..<9 {
            newInit[i][j] = initialGrid[i][(j / 3) * 3 + randomThrees[j/3][j%3]]
            newSolv[i][j] =  solvedGrid[i][(j / 3) * 3 + randomThrees[j/3][j%3]]
        }
    }

    
    initialGrid = newInit
    solvedGrid = newSolv
    
    // shuffle row boxes
    var randomThree = [0, 1, 2]
    shuffleThreeNumbers(numbers: &randomThree, seed: &seed)
    for i in 0..<9 {
        newInit[i] = initialGrid[randomThree[i / 3] * 3 + i % 3]
        newSolv[i] =  solvedGrid[randomThree[i / 3] * 3 + i % 3]
    }
    
    initialGrid = newInit
    solvedGrid = newSolv
    
    // shuffle column boxes
    randomThree = [0, 1, 2]
    shuffleThreeNumbers(numbers: &randomThree, seed: &seed)
    for i in 0..<9 {
        for j in 0..<9 {
            newInit[i][j] = initialGrid[i][randomThree[j / 3] * 3 + j % 3]
            newSolv[i][j] =  solvedGrid[i][randomThree[j / 3] * 3 + j % 3]
        }
    }
    
    initialGrid = newInit
    solvedGrid = newSolv
    
    seed = String(Int(seed, radix: 5) ?? 0)
    
    // shuffle numbers
    
    var shuffledNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    shuffleNineNumbers(numbers: &shuffledNumbers, seed: &seed)
    
    for i in 0..<9 {
        for j in 0..<9 {
            solvedGrid[i][j] = shuffledNumbers[solvedGrid[i][j] - 1]
            if initialGrid[i][j] != 0 {
                initialGrid[i][j] = shuffledNumbers[initialGrid[i][j] - 1]
            }
            else {
                initialGrid[i][j] = -1
            }
        }
    }
}


func shuffleThreeNumbers(numbers: inout [Int], seed: inout String) {
    let permutationNumber = Int.random(in: 0..<6)
    switch permutationNumber {
        case 1:
            numbers = [0, 1, 2]
            seed += "0"
        case 2:
            numbers = [0, 2, 1]
            seed += "1"
        case 3:
            numbers = [1, 0, 2]
            seed += "2"
        case 4:
            numbers = [1, 2, 0]
            seed += "3"
        case 5:
            numbers = [2, 0, 1]
            seed += "4"
        case 6:
            numbers = [2, 1, 0]
            seed += "5"
        default:
            numbers = [0, 1, 2]
            seed += "0"
    }
}

func shuffleNineNumbers(numbers: inout [Int], seed: inout String) { //uff
    let randomNumber = Int.random(in: 0..<9)
    numbers = numbers.map{ ($0 + randomNumber) % 9 + 1}
    seed += "\(randomNumber)"
}


