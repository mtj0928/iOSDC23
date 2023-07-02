import SwiftUI
import SlideKit

@Slide
struct XcodePreviewSlide: View {
    var body: some View {
        CenterTitleSlide("Xcode Preview")
    }
}

struct FooSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            XcodePreviewSlide()
        }
    }
}
