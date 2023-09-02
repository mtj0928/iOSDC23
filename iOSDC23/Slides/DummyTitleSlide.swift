import SwiftUI
import SlideKit

@Slide
struct DummyTitleSlide: View {
    let shouldHideIndex = true

    var body: some View {
        Image(.title)
            .resizable()
            .scaledToFill()
    }

    var script: String {
        """
        こんにちは、まつじです。
        """
    }
}

struct DummyTitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DummyTitleSlide()
        }
    }
}
