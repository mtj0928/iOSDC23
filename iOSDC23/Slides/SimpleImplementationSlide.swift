import SwiftUI
import SlideKit
import Splash

enum SimpleSampleCode {
    static let viewCode = CodeSlide(
        """
        struct ItemListView: View {
            @StateObject let viewModel = ItemListViewModel()

            var body: some View {
                // viewModelのitemsを使ってリストを表示する
            }
        }

        class ItemListViewModel: ObservableObject {
            @Published var items: [Item] = []

            func fetchItems() async throws {
                items = try await APIClient.share.getItems()
            }
        }
        """
//        """
//        struct ItemListView: View {
//            @StateObject let viewModel = ItemListViewModel()
//
//            var body: some View {
//                // viewModelのitemsを使ってリストを表示する
//            }
//        }
//
//        struct ItemListView_Previews: PreviewProvider {
//            static var previews: some View {
//                ItemListView()
//            }
//        }
//        """
    )

    static let viewModelCode = CodeSlide(
        """
        class ItemListViewModel: ObservableObject {
            @Published var items: [Item] = []

            func fetchItems() async throws {
                items = try await APIClient.share.getItems()
            }
        }
        """
    )
}

struct SimpleImplementationSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleSampleCode.viewCode
        }
    }
}
