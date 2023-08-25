import SwiftUI
import SlideKit

@Slide
struct BaketsuRelayIssueSlide: View {
    enum Step: Int, PhasedState {
        case initial, tip, moreDependency, comment
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("バケツリレーの課題") {
            Item("検索画面はAPIを叩くだけなのに、DBの情報も渡す必要がある", accessory: nil)
            Code(code, fontSize: 40)
                .lineSpacing(4)
                .padding(.vertical, 20)
            if step.isAfter(.comment) {
                Item("画面数が増えれば増えるほど「これなんで必要...？」が増える", accessory: nil)
            }
        }
        .overlay(alignment: .topLeading) {
            if step == .tip {
                Color.white.opacity(0.7)
                    .frame(height: 135)
                    .offset(x: 0, y: 360)
                Color.white.opacity(0.7)
                    .frame(height: 60)
                    .offset(x: 0, y: 510)
            }
        }
        .overlay {
            if step == .tip {
                Bubble(
                    orientation: .leading,
                    tipSize: CGSize(width: 30, height: 10)
                ) {
                    Text("これ必要...？")
                        .footnote()
                        .padding()
                }
                .bubbleShape { shape in
                    shape.stroke(lineWidth: 2)
                        .foregroundStyle(Color.label)
                }
                .foregroundStyle(.white)
                .offset(x: -220, y: -15)
            }
        }
    }

    var code: String {
        if step.isAfter(.moreDependency) {
            """
            ItemListView(
                viewModel: ItemListViewModel(apiClient: MockAPIClient()),
                db: MockDatabase(),
                keychain: MockKeychain(),
                fileManager: MockFileManager(),
                userDefaults: MockUserDefaults(),
                authManager: MockAuthManager(),
                logger: MockLogger(),
                ...
            )
            """
        } else {
            """
            ItemListView(
                viewModel: ItemListViewModel(apiClient: MockAPIClient()),
                db: MockDatabase()
            )
            """
        }
    }

    private func highlightBackground(y: CGFloat, height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.red.opacity(0.05))
            .frame(width: 500, height: height)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.red)
            }
            .offset(x: 20, y: y)
    }

    var script: String {
        switch step {
        case .initial:
            """
            これがバケツリレーの課題です。
            検索画面はAPIを叩くだけなのに、遷移先の画面のためにDBも受け取る必要が出てきてしまいます。
            このItemListViewをインターフェースを見た時に
            """
        case .tip:
            "「これ必要...？」と感じますよね。"
        case .moreDependency:
            "Qitta Viewerはとてもまだまだ画面の数が少ない小さなアプリですが、画面の数が増えるとこのように渡す依存の数が増えてしまいます。"
        case .comment:
            "画面の数が増えれば増えるほど、「なんでこれが必要なのか？」と感じるパラメーターが増えてしまいます。"
        }
    }
}

struct BaketsuRelayIssueSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            BaketsuRelayIssueSlide()
                .phase(.comment)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
