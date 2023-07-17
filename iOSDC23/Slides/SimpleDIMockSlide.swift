import SwiftUI
import SlideKit

@Slide
struct SimpleDIMockSlide: View {
    var body: some View {
        CodeSlide(
        """
        private struct MockAPIClient: APIClientProtocol {
            func getItems() async throws -> [Item] {
                // モックしたい処理をここに入れる
            }
        }

        struct ItemListView_Previews: PreviewProvider {
            static var previews: some View {
                let viewModel = ItemListViewModel(apiClient: MockAPIClient())
                ItemListView(viewModel: viewModel)
            }
        }
        """
        )
    }
}

struct SimpleDIMockSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleDIMockSlide()
        }
    }
}
