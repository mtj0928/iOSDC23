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
                let apiClient = MockAPIClient()
                let viewModel = ItemListViewModel(apiClient: apiClient)
                ItemListView(viewModel: viewModel)
            }
        }
        """
        )
    }

    var script: String {
        """
        次に、Xcode PreviewのためにMockAPIClientを用意します。
        実際にモックしたい処理をこのgetItemsの中に書きます。
        成功したUIを確認したいなら、値を返すようにします。
        失敗したUIを確認したいのなら、エラーを投げるようにします。

        MockAPIClientを用意できたら、あとはXcode Previewを利用する際にMockAPIClientを使えば、モックした実装に応じて、適切なUIを確認できます。
        """
    }
}

struct SimpleDIMockSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleDIMockSlide()
        }
    }
}
