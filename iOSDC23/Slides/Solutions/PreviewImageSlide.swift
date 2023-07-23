import SwiftUI
import SlideKit

@Slide
struct PreviewImageSlide: View {
    var body: some View {
        GIFImage(name: "preview.gif")
    }
}

struct PreviewImageSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            PreviewImageSlide()
        }
    }
}
