import SwiftUI
import SlideKit

@Slide
struct TitleSlide: View {
    let shouldHideIndex = true

    var body: some View {
        VStack(alignment: .leading, spacing: 48) {
            Text("Xcode Previewを\n気軽に使うためのDI戦略")
                .font(.system(size: 120, weight: .heavy))
            Text("まつじ")
                .font(.system(size: 50, weight: .bold))
            + Text("（@mtj_j）")
                .font(.system(size: 45, weight: .bold))
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(48)
        .overlay(alignment: .bottomTrailing) {
            Image(.deer)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 700, height: 700)
                .offset(x: 100, y: 100)
        }
        .background {
            Image(.deer)
                .resizable()
                .scaledToFill()
                .overlay(Material.ultraThin)
        }
    }

    var script: String {
        """
        こんにちは、まつじです。
        """
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            TitleSlide()
        }
    }
}
