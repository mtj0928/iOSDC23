import SwiftUI
import SlideKit

@Slide
struct AgendaSlide: View {
    var highlight: Int?

    let shouldHideIndex: Bool = true

    var body: some View {
        VStack(alignment: .leading) {
            item(1, text: "Xcode PreviewでのDI戦略とその課題")
                .overlay {
                    Color.white.opacity(highlight ?? 1 == 1 ? 0 : 0.8)
                }
            item(2, text: "着眼点と解決方法")
                .overlay {
                    Color.white.opacity(highlight ?? 2 == 2 ? 0 : 0.7)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(64)
    }

    func item(_ number: Int, text: String) -> some View {
        HStack(spacing: 32) {
            Text("\(number)")
                .frame(width: 100, height: 100)
                .background(Color.blue.opacity(0.7))
                .foregroundStyle(.white)
                .clipShape(Circle())
            Text(text)
        }
        .subHeadline()
    }
}

struct AgendaSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            AgendaSlide(highlight: 1)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}


