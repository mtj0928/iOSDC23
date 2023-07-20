import SwiftUI
import SlideKit

@Slide
struct ConceptSlide: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Initializer Injection")
            Text("+")
            Text("@Environment")
        }
        .subHeadline()
    }

    var script: String {
        """
        アイデアはシンプルです。
        依存を渡しすぎるInitializer Injectionと、依存を渡さなさすぎるEnvironment、この二つの組み合わせです。
        """
    }
}

struct ConceptSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            ConceptSlide()
        }
    }
}
