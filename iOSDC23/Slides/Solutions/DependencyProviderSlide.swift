import SwiftUI
import SlideKit

@Slide
struct DependencyProviderSlide: View {
    var body: some View {
        CenterTitleSlide("Dependency Provider")
    }

    var script: String {
        """
        ここからは、今見た課題を解決する方法を紹介します。
        僕はこの方法をDependency Providerと呼んでいます。
        """
    }
}

struct DependencyProviderSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderSlide()
        }
    }
}
