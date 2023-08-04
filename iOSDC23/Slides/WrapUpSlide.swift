import SwiftUI
import SlideKit

@Slide
struct WrapUpSlide: View {
    enum Step: Int, PhasedState {
        case initial, feedback
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("まとめ") {
            Item("Xcode Previewを本格的に使うにはDIは重要なテーマ")
            Item("Initializer InjectionやEnvironmentはそれぞれ課題が存在")
            Item("それぞれの良いとこどりなDependencyProviderを提案")
            Item("iOS17からはUIKitで同様のことができるかも...？")

            if step.isAfter(.feedback) {
                Text("アンケート/フィードバック待っています！")
                    .foregroundStyle(.white)
                    .subHeadline()
                    .padding(52)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct WrapupSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            WrapUpSlide()
                .phase(.feedback)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
