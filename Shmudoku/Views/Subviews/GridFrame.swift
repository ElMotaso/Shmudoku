import SwiftUI

struct GridFrame: View {
    var body: some View {
        GeometryReader { geometry in
            let ratioSize = 15.0
            let gridSize = geometry.size.width * (ratioSize - 1) / ratioSize
            let boxSize = gridSize / 3
            let cellSize = gridSize / 9
            
            let lineWidth = 6.0
            let gridHPosition = geometry.size.width / 2 + geometry.size.width / (2 * ratioSize)
            let size = geometry.size.height
            let gridVPosition = size / 2
            
            
            // Thinner lines between normal boxes
            Path { path in
                for i in 1..<9 {
                    let x = Double(i % 3) * cellSize + Double(i / 3) * boxSize
                    let y = Double(i % 3) * cellSize + Double(i / 3) * boxSize
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: gridSize))
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: gridSize, y: y))
                }
                
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth / 8, lineCap: .square, lineJoin: .miter))
            .position(x: gridHPosition, y: gridVPosition)

            // Thick lines between 3x3 boxes
            Path { path in
                for i in 1..<3 {
                    let x = CGFloat(i) * boxSize
                    let y = CGFloat(i) * boxSize
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: gridSize))
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: gridSize, y: y))
                }
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth / 2.75, lineCap: .square, lineJoin: .miter))
            .position(x: gridHPosition, y: gridVPosition + 0.75)

            // Even thicker frame
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: gridSize + lineWidth/4, y: 0))
                path.addLine(to: CGPoint(x: gridSize + lineWidth/4, y: gridSize + lineWidth/4))
                path.addLine(to: CGPoint(x: 0, y: gridSize + lineWidth/4))
                path.addLine(to: CGPoint(x: 0, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth / 2, lineCap: .square, lineJoin: .miter))
            .position(x: gridHPosition - lineWidth/4, y: gridVPosition) // 1.5 = 1/4 lineWidth
        }
    }
}
