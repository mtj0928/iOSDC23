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
