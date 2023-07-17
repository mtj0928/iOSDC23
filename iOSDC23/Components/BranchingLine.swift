import SwiftUI

struct BranchingLine: Shape {
    var branchCount: Int = 3
    var branchRation: CGFloat = 0.5
    var leadingToTrailing = true

    func path(in rect: CGRect) -> Path {
        Path { path in
            let minX = leadingToTrailing ? 0 : rect.maxX
            let maxX = leadingToTrailing ? rect.maxX : 0
            let maxY = rect.maxY
            path.move(to: CGPoint(x: minX, y: maxY / 2))

            let branchingPointX = rect.maxX * (leadingToTrailing ? branchRation : (1 - branchRation))
            path.addLine(to: CGPoint(x: branchingPointX, y: maxY / 2))

            for index in 0..<branchCount {
                path.move(to: CGPoint(x: branchingPointX, y: maxY / 2))

                let y = CGFloat(index) * maxY / CGFloat(branchCount - 1)
                path.addLine(to: CGPoint(x: branchingPointX, y: y))
                path.addLine(to: CGPoint(x: maxX, y: y))
            }
        }
    }
}

