import SwiftUI
import SlideKit

@Slide
struct EnvironmentIssue1Slide: View {
    enum Step: Int, PhasedState {
        case initial, tip
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("@Environmentの課題") {
            Item("必要な依存がわからない", accessory: 1)
            Code(
                """
                struct ItemListView_Previews: PreviewProvider {
                    static var previews: some View {
                        ItemListView()
                            .environment(\\.apiClient, MockAPIClient())
                    }
                }
                """,
                fontSize: 40
            )
            .lineSpacing(4)
            .overlay(alignment: .topLeading) {
                if step.isAfter(.tip) {
                    VStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.blue.opacity(0.05))
                            .frame(width: 1070, height: 65)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.blue)
                            }
                        Bubble(
                            orientation: .top,
                            tipSize: CGSize(width: 15, height: 30),
                            tipPositionRatio: 0.1
                        ) {
                            Text("これを忘れてもコンパイルエラーにならない")
                                .footnote()
                                .padding(32)
                        }
                        .bubbleShape { shape in
                            shape.stroke(lineWidth: 2)
                                .foregroundStyle(Color.label)
                        }
                        .foregroundStyle(.white)
                    }
                    .offset(x: 280, y: 148)
                }
            }
            .padding(.top)
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            しかしEnvironmentを使った場合にも課題はあります。
            一つ目に必要な依存がわからないということです。
            先ほどのItemListViewに対してXcode Previewをしようとすると、以下のようになります。
            Environmentを使って、MockAPIClientをDIしています。
            """
        case .tip:
            """
            しかし、ここのコードがなくてもコンパイルエラーにはなりません。
            ということは開発者は自身で気をつけながら、内部で何を使っているのかを把握した上で適切にDIをする必要が出てきてしまいます。
            さらに例えばspecが変更され、Databaseを内部で使うようになった場合、
            ここにもDIをする必要がありますが、コンパイラはそれを指摘してくません。
            結果としてXcode Previewが動かなくなり、Xcode Previewのためにデバッグする必要が出てきます。
            """
        }
    }
}

struct EnvironmentIssueSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            EnvironmentIssue1Slide()
                .phase(.tip)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
