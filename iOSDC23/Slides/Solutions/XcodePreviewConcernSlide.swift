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
