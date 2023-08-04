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
        .background(alignment: .topLeading) {
            if step.isAfter(.tipA) {
                CodeHighlightBackground(width: 1230, height: 70, y: 140)
                    .offset(x: 100)
            }
        }
        .background(alignment: .topLeading) {
            if step.isAfter(.tipB) {
                CodeHighlightBackground(width: 1150, height: 70, y: 703)
                    .offset(x: 200)
            }
        }
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

    var script: String {
        switch step {
        case .initial:
            """
            ItemListViewとItemListViewModelがあります。
            アーキテクチャーは別になんでもいいのですが、このトークでは馴染み深い人が多いであろう、MVVMで話をしたいと思います。
            """
        case .tipA:
            """
            ItemListViewの中で、ItemListViewModelのインスタンスを生成し、それをStateObjectで管理します。
            """
        case .tipB:
            """
            ItemListViewModelの中ではAPIClientのシングルトンにアクセスし、記事の一覧を取得します。
            """
        }
    }
}

@Slide
struct SimpleSamplePreviewCodeSlide: View {
    var body: some View {
        CodeSlide(
        """
        struct ItemListView_Previews: PreviewProvider {
            static var previews: some View {
                ItemListView()
            }
        }
        """
        )
    }

    var script: String {
        """
        Xcode Previewを利用する側はこんな感じですかね。
        これで無事にItemListViewのPreviewを確認することができます。
        """
    }
}

struct SimpleImplementationSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleSampleViewCodeSlide()
                .phase(.tipB)
        }
    }
}
