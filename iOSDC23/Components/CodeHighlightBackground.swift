import SwiftUI

struct CodeHighlightBackground: View {
    var width: CGFloat = 1200
    let height: CGFloat
    let y: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue.opacity(0.05))
            .frame(width: width, height: height)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.blue)
            }
            .offset(x: 20, y: y)
    }
}
