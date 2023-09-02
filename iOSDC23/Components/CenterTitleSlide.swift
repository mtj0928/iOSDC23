import SwiftUI
import SlideKit

@Slide
struct CenterTitleSlide: View {
    private let text: String
    let script: String

    init(_ text: String, script: String = "") {
        self.text = text
        self.script = script
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
