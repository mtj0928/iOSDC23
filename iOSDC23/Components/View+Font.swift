import SwiftUI

extension View {
    func subHeadline() -> some View {
        font(.system(size: 70, weight: .bold))
            .foregroundStyle(Color.label)
    }

    func footnote() -> some View {
        font(.system(size: 40, weight: .bold))
            .foregroundStyle(Color.label)
    }
}
