import SwiftUI
import SlideKit

@Slide
struct HowToUseDependencyProvider1Slide: View {
    enum Step: Int, PhasedState {
        case initial, full
    }
    @Phase var step: Step

    var body: some View {
        HeaderSlide("DependencyProviderの使い方") {
            Item("各ViewのinitではそのViewが必要な依存だけを宣言する", accessory: 1)
            Code(code, fontSize: 40)
                .lineSpacing(4)
        }
    }

    var code: String {
        switch step {
        case .initial:
            """
            struct ItemListView: View {
                init(viewModel: ItemListViewModel) {
                    ...
                }
            }
            """
        case .full:
            """
            struct ItemListView: View {
                init(viewModel: ItemListViewModel) {
                    ...
                }
            }

            struct ItemListView_Previews: PreviewProvider {
                static var previews: some View {
                    let viewModel = ItemListViewModel(apiClient: MockAPIClient())
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
            まずは各Viewのinitでは必要な依存だけを宣言するようにします。
            遷移先の画面に必要な依存はここでは宣言しません。
            """
        case .full:
            """
            Xcode Previewを利用するのは簡単です。
            その画面を表示するために必要な依存を渡すだけです。
            """
        }
    }
}

struct HowToUseDependencyProvider1Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            HowToUseDependencyProvider1Slide()
                .phase(.full)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
