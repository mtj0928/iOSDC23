import SwiftUI
import SlideKit

@Slide
struct UIKitSlide: View {
    enum Step: Int, PhasedState {
         case initial, ios17
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("UIKitでの対応") {
            VStack(alignment: .leading, spacing: 24) {
                Text("iOS16: 従来のInitializer Injection")
                    .font(.system(size: 54, weight: .semibold))
                Text("SwiftUIと違って型に対して厳密ではないので、Coordinatorパターンなどで対応可能")
                    .footnote()
            }
            .padding(.bottom, 48)

            if step.isAfter(.ios17) {
                VStack(alignment: .leading, spacing: 24) {
                    Text("iOS17: UITraitCollectionが使えるかも？")
                        .font(.system(size: 54, weight: .semibold))
                    Text("SwiftUIのEnvironmentと同様のことがUITraitCollectionで実現可能に！？")
                        .footnote()
                    Image("wwdc")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                }
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
