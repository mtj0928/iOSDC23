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
            Item("各ViewのinitではそのViewが必要な依存だけを宣言する (やりたかったこと)", accessory: 1)
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
