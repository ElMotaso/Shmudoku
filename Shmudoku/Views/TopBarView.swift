import SwiftUI

struct TopBarView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    
    @ObservedObject var sudoku: Sudoku
    @Binding var storedNumber: Int
    @Binding var errorMode: Bool
    @State var fontSize: Double = 22
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text("\(secondsToHoursMinutesSeconds(seconds: sudoku.secondsElapsed))")
                    .font(.custom("CourierNewPS-BoldMT", size: fontSize))
                Spacer()
            }
            HStack {
                Text(errorMode ? "\(sudoku.errorCounter)" : "?")
                    .font(.custom("CourierNewPS-BoldMT", size: fontSize))
                    .foregroundColor(Color.red)
                    .padding(.horizontal)
                Spacer()
                Menu("New"){
                    Button(action: {
                        sudoku.newSudoku(difficulty: 0)
                        storedNumber = -1
                    }) {
                        TextView(text: "Easy")
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        sudoku.newSudoku(difficulty: 1)
                        storedNumber = -1
                    }) {
                        TextView(text: "Medium")
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        sudoku.newSudoku(difficulty: 2)
                        storedNumber = -1
                    }) {
                        TextView(text: "Hard")
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        sudoku.newSudoku(difficulty: 3)
                        storedNumber = -1
                    }) {
                        TextView(text: "Evil")
                        .padding(.horizontal)
                    }
                                
                }
                .padding(.horizontal)
                .font(.custom("CourierNewPS-BoldMT", size: fontSize))
            }
        }
    }
}

func secondsToHoursMinutesSeconds (seconds : Int) -> String {
    let h = seconds / 3600
    let m = (seconds % 3600) / 60
    let s = (seconds % 3600) % 60
    let hours = (h >= 10) ? String(h) : "0" + String(h)
    let mins = (m >= 10) ? String(m) : "0" + String(m)
    let secs = (s >= 10) ? String(s) : "0" + String(s)
    return hours + ":" + mins + ":" + secs
}
