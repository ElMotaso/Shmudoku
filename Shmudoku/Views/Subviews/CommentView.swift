//
//  CommentView.swift
//  Shmudoku
//
//  Created by Bania on 04.01.23.
//

import SwiftUI



struct CommentView: View {
    
    @ObservedObject var sudoku: Sudoku
    @State var cellSize: Double
    @State var fontSize: Double
    @State var row: Int
    @State var column: Int
    @State var possibleNumbers: [Int]
    
    
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { subrow in
                HStack {
                    ForEach(0..<3, id: \.self) { subcolumn in
                        let digit = commentToDigit(grid: sudoku.commentGrid[row][column], i: subrow, j: subcolumn)
                        Text(digit)
                            .font(.custom("CourierNewPS-BoldMT", size: fontSize))
                            .frame(width: cellSize, height: cellSize)
                            .foregroundColor(Color.gray) // (possibleNumbers.contains(subrow * 3 + subcolumn + 1) ? Color.gray : Color.red))
                        
                    }
                }
            }
        }
    }
    
    func commentToDigit(grid: [[Bool]], i: Int, j: Int) -> String {
        if grid[i][j] {
            return String(i * 3 + j + 1)
        }
        return ""
    }
    
    
}

