import SwiftUI

struct NumberView: View {
    @ObservedObject var sudoku: Sudoku
    @Binding var storedNumber: Int
    @Binding var commentMode: Bool
    @Binding var errorMode: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.height * 0.09 //70.0
            let fontSize = 27.0
            VStack {
                    Spacer()
                    ForEach(0..<3 + 1, id: \.self) { row in
                        HStack {
                            ForEach(0..<3, id: \.self) { column in
                                Button(action: {
                                    storedNumber = column + row * 3 + 1
                                }) {
                                    if row == 3 {
                                        if column == 0 {
                                            Button(action: {
                                                errorMode = !errorMode
                                                UserDefaults.standard.set(errorMode, forKey: "errorMode")

                                            }) {
                                                Image(systemName: errorMode ? "eye" : "eye.slash")
                                                    .frame(width: size * 1.1, height: size)
                                                    .font(.system(size: fontSize - 2))
                                                    .foregroundColor(errorMode ? Color.red : Color.gray)
                                            }
                                        }
                                        if column == 1 {
                                            Button(action: {
                                                storedNumber = -1
                                            }) {
                                                Image(systemName: "trash")
                                                    .frame(width: size * 1.1, height: size)
                                                    .font(.system(size: fontSize))
                                                    .foregroundColor(commentMode ? Color.gray : Color.blue)
                                            }
                                        } else if column == 2 {
                                            Button(action: {
                                                commentMode.toggle()
                                            }) {
                                                Image(systemName: "square.and.pencil")
                                                    .frame(width: size * 1.1, height: size)
                                                    .font(.system(size: fontSize - 2))
                                                    .foregroundColor(commentMode ? Color.blue : Color.gray)
                                            }
                                        }
                                    } else{
                                        TextView(text: "\(column + row * 3 + 1)", fontSize: fontSize)
                                            .frame(width: size * 1.1, height: size)
                                            .foregroundColor(commentMode || sudoku.finishedDigits()[column + row * 3] ? Color.gray : Color.blue)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            .position(x: geometry.size.width / 2, y: geometry.size.width * 0.85)

        }
        
    }
}
