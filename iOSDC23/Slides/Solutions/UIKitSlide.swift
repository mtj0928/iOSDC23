import SwiftUI
import SlideKit

@Slide
struct UIKitSlide: View {
    enum Step: Int, PhasedState {
         case initial
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("iOS17からはUIKitでもできます") {
            Item("UITraitCollectionでSwiftUIのEnvironmentと同様のことが可能に！", accessory: nil)
            Item("詳しくはWWDCのセッション動画を参照してください", accessory: nil)
            Spacer()
            VStack(alignment: .leading) {
                Image(.wwdc)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                Text("https://developer.apple.com/videos/play/wwdc2023/10057/")
                    .footnote()
            }
        }
    }
}

struct UIKitSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            UIKitSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
