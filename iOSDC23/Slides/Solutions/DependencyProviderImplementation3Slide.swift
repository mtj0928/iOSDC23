import SwiftUI
import SlideKit

@Slide
struct DependencyProviderImplementation3Slide: View {
    var body: some View {
        HeaderSlide("DependencyProvider") {
            Item("AppDependencyをEnvironmentに渡す", accessory: 3)
            Code(
                """
                let dependency = AppDependency(
                    apiClient: APIClient(),
                    database: Database()
                )

                AppRootView()
                    .environment(\\.dependency, dependency)
                """,
                fontSize: 40
            )
            .lineSpacing(4)
        }
    }
}

struct DependencyProviderImplementation3Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderImplementation3Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
