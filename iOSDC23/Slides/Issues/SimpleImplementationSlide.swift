import SwiftUI
import SlideKit
import Splash

@Slide
struct SimpleSampleViewCodeSlide: View {
    enum Step: Int, PhasedState {
        case initial, tipA, tipB
    }

    @Phase var step: Step

    var body: some View {
        CodeSlide("""
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
        )
        .overlay {
            if step.isAfter(.tipA) {
                Bubble(
                    orientation: .leading,
                    tipSize: CGSize(width: 50, height: 25),
                    cornerRadius: 24
                ) {
                    Text("ViewModelを\nStateObjectで管理")
                        .footnote()
                        .padding(32)
                }
                .bubbleShape { shape in
                    shape.stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(Color.label)
                }
                .foregroundStyle(.white)
                .offset(x: 630, y: -370)
            }

            if step.isAfter(.tipB) {
                Bubble(
                    orientation: .top,
                    tipSize: CGSize(width: 20, height: 40),
                    tipPositionRatio: 0.2,
                    cornerRadius: 24
                ) {
                    Text("API経由でitemsを取得")
                        .footnote()
                        .padding(32)
                }
                .bubbleShape { shape in
                    shape.stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(Color.label)
                }
                .foregroundStyle(.white)
                .offset(x: 330, y: 310)
            }
        }
    }
}
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
    )

    static let previewCode = CodeSlide(
        """
        struct ItemListView_Previews: PreviewProvider {
            static var previews: some View {
                ItemListView()
            }
        }
        """
    )
}

struct SimpleImplementationSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleSampleViewCodeSlide()
        }
    }
}
