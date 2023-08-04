import SwiftUI
import SlideKit

@Slide
struct DependencyProviderImplementation1Slide: View {
    var body: some View {
        HeaderSlide("DependencyProvider") {
            Item("DIしたいオブジェクトをまとめたstructを作る", accessory: 1)
            Code(
                """
                struct AppDependency {
                    let apiClient: APIClientProtocol
                    let database: DatabaseProtocol
                }
                """,
                fontSize: 40
            )
            .lineSpacing(4)
        }
    }

    var script: String {
        """
        まずはDIされうる可能性のあるオブジェクトをstructにまとめます。
        今回の場合、API ClientとDatabaseの二つが依存として考えられるので、これをまとめたAppDependencyを用意します。
        """
    }
}

struct DependencyProviderImplementation1Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderImplementation1Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
