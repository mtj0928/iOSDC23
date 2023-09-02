import SwiftUI
import SlideKit

@Slide
struct SimpleDIMockSlide: View {

    enum Step: Int, PhasedState {
        case initial, preview
    }

    @Phase var step: Step

    var body: some View {
        CodeSlide(code)
    }

    var code: String {
        switch step {
        case .initial:
            """
            private struct MockAPIClient: APIClientProtocol {
                func getItems() async throws -> [Item] {
                    // モックしたい処理をここに入れる
                }
            }
            """
        case .preview:
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
        }
    }

    var script: String {
        switch step {
        case .initial:
             """
            最後に、Xcode PreviewのためにMockAPIClientを用意します。
            実際にモックしたい処理をこのgetItemsの中に書きます。
            成功したUIを確認したいなら、正しい値を返すようにします。
            失敗したUIを確認したいのなら、エラーを投げるようにします。
            """
        case .preview:
            """
            MockAPIClientを用意できたら、あとはXcode Previewを利用する際にMockAPIClientを使えば、モックした実装に応じて、適切なUIを確認できます。
            """
        }
    }
}

struct SimpleDIMockSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleDIMockSlide()
        }
    }
}
