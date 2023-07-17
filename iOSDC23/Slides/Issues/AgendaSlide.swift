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


