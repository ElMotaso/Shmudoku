import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @ObservedObject var sudoku = Sudoku()
    @State var storedNumber: Int = -1
    @State var commentMode: Bool = false
    
    //@FetchRequest(
    //    entity: Shmudoku.entity(), sortDescriptors: []
    //) var fetchedSudokus: FetchedResults<Shmudoku>
    
    
    var body: some View {
        SudokuView(sudoku: sudoku, storedNumber: $storedNumber, commentMode: $commentMode)
            .onAppear {
                if !sudoku.checkIfFinished() {
                    sudoku.startTimer()
                }
            }
    }
}
