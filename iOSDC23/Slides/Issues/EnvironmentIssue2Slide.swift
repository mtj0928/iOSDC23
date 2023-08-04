import SwiftUI
import SlideKit

@Slide
struct EnvironmentIssue2Slide: View {
    enum Step: Int, PhasedState {
        case initial, tip
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("@Environmentの課題") {
            Item("initでアクセスができない", accessory: 2)
            Code(
                """
                struct ItemListView: View {
                    @Environment(\\.apiClient) var apiClient: APIClientProtocol?
                    @StateObject var viewModel: ItemListViewModel

                    init() {
                        self.viewModel = ItemListViewModel(apiClient: apiClient)
                    }

                    var body: some View { ... }
                }
                """,
                fontSize: 40
            )
            .lineSpacing(4)
            .padding(.top)
            .overlay(alignment: .topLeading) {
                if step.isAfter(.tip) {
                    VStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.blue.opacity(0.05))
                            .frame(width: 1430, height: 65)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.blue)
                            }
                        Bubble(
                            orientation: .top,
                            tipSize: CGSize(width: 15, height: 30),
                            tipPositionRatio: 0.1
                        ) {
                            Text("initでEnvironmentの値にアクセスできず\nViewModelが作れない")
                                .footnote()
                                .padding(32)
                        }
                        .bubbleShape { shape in
                            shape.stroke(lineWidth: 2)
                                .foregroundStyle(Color.label)
                        }
                        .foregroundStyle(.white)
                    }
                    .offset(x: 180, y: 264)
                }
            }
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            2つ目の課題として、initでEnvironmentにアクセスができないという 課題です。
            例えば、APIClientを元にViewModelを使いたい、というシチュエーションはよくあるケースのように感じます。
            """
        case .tip:
            """
            しかしAPIClientがEnvironment経由でパスされている場合、initの中でEnvironmentの値にアクセスすることができません。
            アクセスしようとすると、XcodeがRuntimeで警告をだします。
            """
        }
    }
}

struct EnvironmentIssue2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            EnvironmentIssue2Slide()
                .phase(.tip)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
