import SwiftUI
import SlideKit

@Slide
struct BaketsuRelayIssueSlide: View {
    enum Step: Int, PhasedState {
        case initial, tip, comment
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("バケツリレーの課題") {
            Item("検索画面はAPIを叩くだけなのに、DBの情報も渡す必要がある", accessory: nil)
            Code(
                """
                struct ItemListView_Previews: PreviewProvider {
                    static var previews: some View {
                        let viewModel = ItemListViewModel(apiClient: MockAPIClient())
                        ItemListView(
                            db: MockDatabase(),
                            viewModel: viewModel
                        )
                    }
                }
                """,

                fontSize: 40
            )
            .lineSpacing(4)
            .padding(.vertical, 40)
            if step.isAfter(.comment) {
                Item("画面数が増えれば増えるほど「これなんで必要...？」が増える", accessory: nil)
            }
        }
        .overlay(alignment: .topLeading) {
            if step.isAfter(.tip) {
                Color.white.opacity(0.7)
                    .frame(height: 220)
                    .offset(x: 0, y: 380)
                Color.white.opacity(0.7)
                    .frame(height: 220)
                    .offset(x: 0, y: 650)
            }
        }
        .overlay {
            if step.isAfter(.tip) {
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
                .offset(x: 10, y: 85)
            }
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
}

struct BaketsuRelayIssueSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            BaketsuRelayIssueSlide()
                .phase(.tip)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
