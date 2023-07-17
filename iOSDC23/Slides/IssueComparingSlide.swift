import SwiftUI
import SlideKit

@Slide
struct IssueComparingSlide: View {
    var body: some View {
        HeaderSlide("課題の要約") {
            Item("Initializer Injection", accessory: nil) {
                Item("画面の数が増えるほど渡す依存が増えて、Xcode Previewを試しにくくなる")
                Item("どの依存がXcode Previewに実際に必要な依存か曖昧になる")
            }
            .padding(.bottom, 48)
            Item("@Environment", accessory: nil) {
                Item("何をDIするべきか、コンパイラはわからない")
                Item("initではアクセスできないので、ObservableObjectを作るには工夫が必要")
            }
        }
    }
}

struct IssueComparingSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            IssueComparingSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
