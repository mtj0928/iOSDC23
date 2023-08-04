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

    var script: String {
        switch step {
        case .initial:
            """
            これがInitializer injectionです。
            コンパイル時にDIされていることを保証をすることができるので、単純ながら一番安全なDI手法となります。
            一方で課題もあって、依存のバケツリレーが必要ということです。
            """
        case .second:
            """
            このバケツリレーについて、もう少し説明をしていきます。
            """
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
