import SwiftUI
import SlideKit

@Slide
struct SimpleImplementationIssueSlide: View {
    var body: some View {
        HeaderSlide("Xcode Previewを使う上での問題点") {
            Item("毎回APIの呼び出しが走ってしまう")
            Item("UIのステータスのコントロールができない") {
                Item("APIの呼び出しに成功した時のUI")
                Item("APIの呼び出しに失敗した時のUI")
                Item("APIを呼び出している間のUI")
            }
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

struct CustomHeaderSlideStyle: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 80) {
            configuration.header
                .font(.system(size: 90, weight: .bold))
            VStack(alignment: .leading, spacing: 48) {
                configuration.content
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 48)
        .padding(.vertical, 60)
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
