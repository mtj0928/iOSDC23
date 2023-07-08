import SwiftUI
import SlideKit

@Slide
struct XcodePreviewSlide: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Xcode Preview")
                .subHeadline()
                .padding(.horizontal, 120)
            Image(.xcodePreview)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 18)
                .padding(.trailing, 48)
        }
    }
}

struct XcodePreviewSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            XcodePreviewSlide()
        }
    }
}
