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

    var script: String {
        """
        Environmentの使い方はこんな感じですね。
        アプリのRootとなるViewに対して、environmentとして、APIやdatabaseを渡します。
        このEnvironmentを使いたいViewは、EnvironmentのpropertyWrapperを使って、取り出せることができます。
        このやり方だと、バケツリレーが発生しないので、良さそうです。
        """
    }
}

struct EnvironmentSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            EnvironmentSlide()
        }
    }
}
