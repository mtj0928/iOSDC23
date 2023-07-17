import SwiftUI
import SlideKit

@Slide
struct CenterTitleSlide: View {
    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.system(size: 98, weight: .bold))
            .foregroundStyle(Color.label)
            .multilineTextAlignment(.center)
    }

    var shouldHideIndex: Bool { true }
}

struct CenterTitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CenterTitleSlide("Center")
        }
    }
}
