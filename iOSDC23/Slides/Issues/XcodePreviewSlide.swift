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
        .allowsHitTesting(false)
    }

    var script: String {
        """
        Xcode Preview、みなさん使っていますか？
        Xcode Previewはアプリをビルドすることなく、UIの動作確認ができるため、開発のスピードを向上させることができます。
        しかし、使うにも課題があります。
        今日の発表ではその課題のうちの一つ、DIに着目し、みなさんがもっと気軽にXcode Previewを使えるよう、僕の知見を共有したいと思います。
        """
    }
}

struct XcodePreviewSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            XcodePreviewSlide()
        }
    }
}
