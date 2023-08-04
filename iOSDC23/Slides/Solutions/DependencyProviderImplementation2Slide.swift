import SwiftUI
import SlideKit

@Slide
struct DependencyProviderImplementation2Slide: View {
    var body: some View {
        HeaderSlide("DependencyProvider") {
            Item("AppDependencyをEnvironmentに渡す", accessory: 2)
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

    var script: String {
        """
        AppDependencyのオブジェクトを作って、それをRootのViewからEnvironmentに流します。
        依存ごとに渡すのではなくて、依存をまとめるところが一つのポイントです。
        こうすることで、依存が増えた時にコンパイルエラーで気づけます。
        """
    }
}

struct DependencyProviderImplementation2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderImplementation2Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
