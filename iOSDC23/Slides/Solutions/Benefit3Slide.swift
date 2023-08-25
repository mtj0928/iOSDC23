import SwiftUI
import SlideKit

@Slide
struct Benefit3Slide: View {
    var body: some View {
        HeaderSlide("DependencyProviderの何が嬉しいか") {
            Item("DIの方法がView層で閉じている", accessory: 4) {
                Item("プレゼンテーション層やビジネスロジック層ではシンプルな\nIxnitializer Injectionを維持できる")
                Item("単体テストではDependencyProviderに依存する必要がない")
            }
        }
    }
}

struct Benefit3Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            Benefit3Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
