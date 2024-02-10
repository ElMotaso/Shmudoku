//
//  Text.swift
//  Shmudoku
//
//  Created by Thomas Moissl on 17.01.23.
//

import SwiftUI

struct TextView: View {
    @State var text: String
    @State var fontSize: Double = 25
    var body: some View {
        Text(text)
            .font(.custom("CourierNewPS-BoldMT", size: fontSize))
    }
}

