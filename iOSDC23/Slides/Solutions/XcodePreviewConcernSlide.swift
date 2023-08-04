import SwiftUI
import SlideKit

@Slide
struct XcodePreviewConcernSlide: View {

    enum Step: Int, PhasedState {
        case initial, tip
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("Xcode Previewの関心範囲") {
            Item("Xcode Preview時の関心は対象の画面だけであり、他の画面に関心はない", accessory: nil)

            Code(
            """
            struct ItemListView: View { ... }

            struct ItemListView_Previews: PreviewProvider {
                static var previews: some View {
                    ItemListView(viewModel: ...)
                }
            }

            """,
            fontSize: 40
            )
            .lineSpacing(4)
            .frame(maxHeight: .infinity, alignment: .center)
            .overlay(alignment: .topLeading) {
                if step.isAfter(.tip) {
                    Bubble(
                        orientation: .leading,
                        tipSize: CGSize(width: 50, height: 20)
                    ) {
                        Text("ItemListViewにだけ興味があり\n遷移先の画面に興味はない")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape.stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 965, y: 280)
                }
            }
            .background(alignment: .topLeading) {
                if step.isAfter(.tip) {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.blue.opacity(0.05))
                        .frame(width: 900, height: 170)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.blue)
                        }
                        .offset(x: 80, y: 280)
                }
            }
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            まずは我々がXcode Previewを使う時の関心の範囲に着目してみましょう。
            Xcode Previewを使うとき、多くの場合で特定の画面にだけ関心があり、遷移先など他の画面に対して関心があることは薄い気がします。
            例えば、このItemListViewと、ItemListViewのPreviewの場合、
            """
        case .tip:
            """
            ItemListViewにだけ興味があり、遷移先のViewについては関心の範囲外だと思います。
            なのでItemListViewだけをXcode Previewで確認できたら十分だと考えられます。
            この性質を利用していきます。
            """
        }
    }
}

struct XcodePreviewConcernSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            XcodePreviewConcernSlide()
                .phase(.tip)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
