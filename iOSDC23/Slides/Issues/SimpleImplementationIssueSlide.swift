import SwiftUI
import SlideKit

@Slide
struct SimpleImplementationIssueSlide: View {
    enum Step: Int, PhasedState {
        case initial, itemA, itemB
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("Xcode Previewを使う上での問題点") {
            Code("""
            // ViewModelの中の関数
            func fetchItems() async throws {
                items = try await APIClient.share.getItems()
            }
            """, fontSize: 40)
            .lineSpacing(4)
            .padding(.bottom, 18)
            if step.isAfter(.itemA) {
                Item("毎回APIの呼び出しが走ってしまう")
            }
            if step.isAfter(.itemB) {
                Item("UIのステータスのコントロールができない") {
                    Item("APIの呼び出しに成功した時のUI")
                    Item("APIの呼び出しに失敗した時のUI")
                    Item("APIを呼び出している間のUI")
                }
            }
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            しかし、今見たこのシングルトンを使ったAPI呼び出しにはいくつかの課題があります。
            """
        case .itemA:
            """
            まず始めに、Xcode Previewをするたび、実際のネットワーク通信が毎回走ってしまうことです。
            開発中には不要なAPI呼び出しは避けたいものです。
            """
        case .itemB:
            """
            そして、UIのステータスのコントロールができないのも問題です。
            例えば、APIの呼び出しに成功した時、失敗した時、そしてAPI呼び出しをしてい間、といった状態のUI を今の実装では自由に確認することができません。
            もしこのサーバーの実装が未実装だったら、その実装が終わるまで正しいUIの確認はできなくなってしまいます。
            """
        }
    }
}

struct SimpleImplementationIssueSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleImplementationIssueSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}

struct ExpandVStack: Layout {
    let spacing: CGFloat

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        // サブビュー内の最大サイズ
        let maxSize = maxSize(subviews: subviews)
        let totalSpacing = CGFloat(max(subviews.count - 1, 0)) * spacing

        return CGSize(
            width: maxSize.width,
            height: maxSize.height + totalSpacing
        )

    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var currentY = bounds.minY

        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            subview.place(
                at: CGPoint(x: 48, y: currentY),
                anchor: .topLeading,
                proposal: ProposedViewSize(
                    width: bounds.width,
                    height: bounds.maxY - currentY
                )
            )

            currentY += subviewSize.height + spacing
        }
    }

    /// サブビュー内の最大サイズを取得する
    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero) { currentMax, subviewSize in
            CGSize(
                width: max(currentMax.width, subviewSize.width),
                height: currentMax.height + subviewSize.height
            )
        }
        return maxSize
    }
}

struct CustomHeaderSlideStyle: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
//        VStack(alignment: .leading, spacing: 80) {
        ExpandVStack(spacing: 80) {
            configuration.header
                .font(.system(size: 90, weight: .bold))
            VStack(alignment: .leading, spacing: 48) {
                configuration.content
            }
            .frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 48)
        .padding(.vertical, 60)
        .frame(
            width: SlideSize.standard16_9.width,
            height: SlideSize.standard16_9.height,
            alignment: .topLeading
        )
        .foregroundStyle(Color.label)
    }
}

struct CustomItemStyle: ItemStyle {
    var fontSize: CGFloat = 40

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 28) {
            HStack(alignment: .firstTextBaseline, spacing: fontSize * 0.5) {
                if let accessory = configuration.accessory {
                    AccessoryView(accessory: accessory, fontSize: fontSize)
                        .font(.system(size: 54 - 4 * CGFloat(configuration.itemDepth), weight: .semibold))
                }

                configuration.label
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 54 - 4 * CGFloat(configuration.itemDepth), weight: .semibold))
            }

            if let child = configuration.child {
                child.padding(.leading, fontSize * 2)
            }
        }
    }
}

struct AccessoryView: View {
    let accessory: ItemAccessory
    let fontSize: CGFloat

    var body: some View {
        switch accessory {
        case .bullet:
            Circle()
                .frame(width: fontSize * 20 / 48, height: fontSize * 20 / 48)
                .aspectRatio(1.0, contentMode: .fill)
                .offset(y: -fontSize / 5)
        case .string(let text):
            Text("\(text) ")
        case .number(let number):
            Text("\(number).")
        }
    }
}
