import SwiftUI
import SlideKit

@Slide
struct Benefit1Slide: View {
    var body: some View {
        HeaderSlide("DependencyProviderの何が嬉しいか") {
            Item("各Viewは必要な依存だけをinitで宣言できる", accessory: 2) {
                Item("遷移先の画面のための依存は必要ない")
                Item("Xcode Previewを利用するための必要十分な依存をコンパイラが知れる")
                Item("呼び出し側がどのように依存解決をしているのか知る必要はない")
            }
        }
    }
}

struct Benefit1Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            Benefit1Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
