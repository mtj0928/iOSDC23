import SwiftUI
import SlideKit

@Slide
struct UIKitSlide: View {
    var body: some View {
        HeaderSlide("UIKitでの対応") {
            Item(accessory: nil) {
                VStack(alignment: .leading, spacing: 24) {
                    Text("iOS16: 従来のInitializer Injection")
                    Text("SwiftUIと違って型に対して厳密ではないので、Coordinatorパターンなどで対応可能")
                        .footnote()
                }
            }
            .padding(.bottom, 48)

            Item("iOS17: UITraitCollectionが使えるかも？", accessory: nil) {
                Item("Unleash the UIKit trait system", accessory: nil)
                Image("wwdc")
                    .resizable()
                    .scaledToFit()
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
