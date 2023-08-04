import SwiftUI
import SlideKit

@Slide
struct Benefit2Slide: View {
    var body: some View {
        HeaderSlide("DependencyProviderの何が嬉しいか") {
            Item("Environmentの設定を忘れることがない", accessory: 2) {
                Item("AppDependencyの設定は一回で良い")
                Item("仮に設定し忘れていたら至るところで画面が真っ赤になるので、すぐに気付ける")
                Item("依存を追加する時は、AppDependencyに追加する") {
                    Item("AppDependencyを作っている箇所で設定漏れがあったらコンパイルエラーになる")
                }
            }
        }
    }
}

struct Benefit2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            Benefit2Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
