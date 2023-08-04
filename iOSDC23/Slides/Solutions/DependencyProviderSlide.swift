import SwiftUI
import SlideKit

@Slide
struct DependencyProviderSlide: View {
    var body: some View {
        CenterTitleSlide("Dependency Provider")
    }

    var script: String {
        """
        僕このアプローチをDependency Providerと呼んでいます。
        では、ここからはDependency Providerの詳細な実装を見ていきましょう。
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
