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

    var script: String {
        """
        アプリのイメージはこんな感じです。
        QiitaのAPIを叩いて、記事を取得し、各記事をタップすると詳細画面に遷移します。
        詳細画面では右上の保存ボタンを押すと、記事をローカルに保存することができます。
        """
    }
}

struct SearchScreenCaptureSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SearchScreenCaptureSlide()
        }
    }
}
