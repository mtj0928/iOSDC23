import SwiftUI
import SlideKit

@Slide
struct EnvironmentSlide: View {
    var body: some View {
        CodeSlide(
            """
            RootView()
                .environment(\\.apiClient, APIClient())
                .environment(\\.database, Database())


            struct ItemListView: View {
                @Environment(\\.apiClient) var apiClient: APIClientProtocol
            }
            """
        )
    }
}

struct EnvironmentSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            EnvironmentSlide()
        }
    }
}
