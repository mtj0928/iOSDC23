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

    var script: String {
        switch step {
        case .initial:
            """
            画面の数が増えていくほどに用意する依存の数が増えてしまうので、ちょっと画面の確認がしたいのにたくさんの依存を渡す必要が発生し、結果としてXcode Previewを気軽に使うのが難しくなってしまくいます。
            """
        case .itemA:
            """
            さらにXcode PreviewをしたいViewがどの依存に対して実際に操作するのか呼び出し側にはわからないです。
            さっきの例だと、DBを触るのか、それともAPIを叩くのかは不透明です。
            これはXcode Previewをする時に、どの値をモックしたらどこにどう反映されるのかを把握するのが難しくなります。
            作ったばっかのViewならまだしも、作ってから時間が経ったViewの場合、これは結構辛い問題です。
            """
        }
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
