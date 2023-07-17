import SwiftUI
import SlideKit

@Slide
struct SearchScreenCaptureSlide: View {

    var body: some View {
        GIFImage(name: "searchScreenCapture.gif")
            .clipShape(RoundedRectangle(cornerRadius: 65))
            .shadow(radius: 10)
            .padding(.vertical, 60)
    }
}

struct SearchScreenCaptureSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SearchScreenCaptureSlide()
        }
    }
}
