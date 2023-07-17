import SwiftUI
import SlideKit

@Slide
struct InitInjectionSlide: View {
    enum Step: Int, PhasedState {
        case initial, second
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("Initializer Injection") {
            Item("一番安全なDI手法", accessory: "✅") {
                Item("コンパイル時にDIされていることを保証できる")
            }
            .opacity(step.isAfter(.second) ? 0.3 : 1.0)
            Item("依存のバケツリレーが必要", accessory: "❌")
        }
    }
}

struct InitInjectionSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            InitInjectionSlide()
                .phase(.second)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
