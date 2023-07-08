import AVKit
import SwiftUI
import SlideKit

@Slide
struct SampleAppSlide: View {

    var body: some View {
        GeometryReader { proxy in
            HStack {
                iconAndText
                    .frame(width: proxy.size.width / 2)
//                if step == .screenshot {
//                    Image(.appScreenshot)
//                        .resizable()
//                        .scaledToFit()
//                        .shadow(radius: 10)
//                        .frame(width: proxy.size.width / 2)
//                        .frame(height: 900)
//                }
            }
//            .animation(.default.speed(0.5), value: step)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }

    private var iconAndText: some View {
        VStack(alignment: .center, spacing: 32) {
            AppIcon()
                .frame(height: 160)

            VStack(alignment: .center, spacing: 24) {
                VStack(spacing: 12) {
                    Text("Qiita Viewer")
                        .subHeadline()
                    Text("Qiitaの記事を検索して、端末に保存するアプリ")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color.label)
                }

                Text(verbatim: "https://github.com/mtj0928/QiitaViewer")
                    .font(.system(size: 32))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

struct SampleAppSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SampleAppSlide()
        }
    }
}
