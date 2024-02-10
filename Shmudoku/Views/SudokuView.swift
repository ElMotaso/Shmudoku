//
//  Sudoku.swift
//  Shmudoku
//
//  Created by Bania on 04.01.23.
//

import SwiftUI

struct SudokuView: View {
    
    @ObservedObject var sudoku: Sudoku
    @Binding var storedNumber: Int
    @Binding var commentMode: Bool
    @State var errorMode: Bool = UserDefaults.standard.bool(forKey: "errorMode")
    
    var body: some View {
        VStack {
            TopBarView(sudoku: sudoku, storedNumber: $storedNumber, errorMode: $errorMode)
            ZStack {
                ButtonGridView(sudoku: sudoku,  storedNumber: $storedNumber, commentMode: $commentMode, errorMode: $errorMode)
                //GridFrame()
                NumberView(sudoku: sudoku, storedNumber: $storedNumber, commentMode: $commentMode, errorMode: $errorMode)
            }
        }
    }
    
    
}
