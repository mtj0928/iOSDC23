import SwiftUI
import SlideKit

@Slide
struct AgendaSlide: View {
    var body: some View {
        HeaderSlide("Today's topic") {
            Item("Xcode PreviewでDIが必要な理由")
            Item("一般的なDI戦略と課題")
            Item("提案手法、Dependency Provider")  
        }
    }
}

struct AgendaSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            AgendaSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
    }
}

struct CustomHeaderSlideStyle: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 80) {
            configuration.header
                .font(.system(size: 110, weight: .heavy))
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
