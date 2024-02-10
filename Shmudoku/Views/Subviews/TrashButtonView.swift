
// idk why this has to be created but if I have it in the NumberView (only occurance of this view) the compiler fails to type check

import SwiftUI

struct TrashButtonView: View {
    @Binding var storedNumber: Int
    @State var size: Double
    @State var fontSize: Double
    @State var commentMode: Bool
    
    var body: some View {
        Button(action: {
            storedNumber = -1
        }) {
            Image(systemName: "trash")
                .frame(width: size * 1.1, height: size)
                .font(.system(size: fontSize))
                .foregroundColor(commentMode ? Color.gray : Color.blue)
        }
    }
}

