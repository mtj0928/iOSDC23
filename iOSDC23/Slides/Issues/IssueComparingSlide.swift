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

    var script: String {
        """
        さて、ここまでの課題をまとめてみましょう。
        Initializer Injectionはバケツリレーが必要で、画面の数が増えるほど渡す依存の数が増えて、Xcode Previewを試しにくくなります。
        また、Xcode PreviewをしたいViewに対してどの依存が実際に必要か曖昧で、Previewをする時のmockに困ります。
        一方でEnvironmentを使ったやり方だと、何をDIすべきかコンパイラはわからないという課題があります。
        また、initではアクセスできないので、ObservableObjectを作るには工夫が必要です。
        """
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
