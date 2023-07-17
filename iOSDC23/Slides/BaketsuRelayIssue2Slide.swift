import SwiftUI
import SlideKit

@Slide
struct BaketsuRelayIssue2Slide: View {
    enum Step: Int, PhasedState {
        case initial, itemA
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("バケツリレーの課題") {
            Item("画面の数が増えるほど必要な依存が増えて、Xcode Previewを\n気軽に試せなくなる")
                .padding(.bottom)
                .opacity(step.isAfter(.itemA) ? 0.2 : 1.0)
            if step.isAfter(.itemA) {
                Item("対象のViewがどの依存を実際に操作するのか呼び出し側はわからない") {
                    Item("DBを触るのか、それともAPIを叩くのか")
                    Item("Xcode Preview時に何をモックするとどう反映されるのかの把握が難しくなる")
                }
            }
        }
        .lineSpacing(10)
    }
}

struct BaketsuRelayIssue2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            BaketsuRelayIssue2Slide()
                .phase(.itemA)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
