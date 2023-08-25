import SwiftUI
import SlideKit

@Slide
struct SimpleDISampleViewModelCodeSlide: View {

    enum Step: Int, PhasedState {
        case initial, tipProtocol, tipInit, tipUsage
    }

    @Phase var step: Step

    var body: some View {
        CodeSlide(newCode)
            .animation(.default, value: step == .initial)
            .background(alignment: .leading) {
                if step.isAfter(.tipProtocol) {
                    CodeHighlightBackground(height: 200, y: -360)
                }
                if step.isAfter(.tipInit) {
                    CodeHighlightBackground(height: 270, y: 40)
                }
                if step.isAfter(.tipUsage) {
                    CodeHighlightBackground(height: 60, y: 302)
                }
            }
            .overlay(alignment: .leading) {
                if step.isAfter(.tipProtocol) {
                    Bubble(tipSize: CGSize(width: 60, height: 20), cornerRadius: 10) {
                        Text("APIClient用にprotocolを定義")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape.stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 1200, y: -360)
                }
            }
            .overlay(alignment: .leading) {
                if step.isAfter(.tipInit) {
                    Bubble(tipSize: CGSize(width: 60, height: 20), cornerRadius: 10) {
                        Text("protocolをinitで差し込む")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape.stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 1200, y: 40)
                }
            }
            .overlay(alignment: .leading) {
                if step.isAfter(.tipUsage) {
                    Bubble(tipSize: CGSize(width: 60, height: 20), cornerRadius: 10) {
                        Text("シングルトンの代わりに\nDIされたAPIClinetを使う")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape.stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 1200, y: 305)
                }
            }
    }

    private func highlightBackground(y: CGFloat, height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue.opacity(0.05))
            .frame(width: 1200, height: height)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.blue)
            }
            .offset(x: 20, y: y)
    }

    private var newCode: String {
        """
        protocol APIClientProtocol {
            func getItems() async throws -> [Item]
        }

        class ItemListViewModel: ObservableObject {
            @Published var items: [Item] = []

            let apiClient: APIClientProtocol

            init(apiClient: APIClientProtocol) {
                self.apiClient = apiClient
            }

            func fetchItems() async throws {
                items = try await apiClient.getItems()
            }
        }
        """
    }

    var script: String {
        switch step {
        case .initial:
            """
            DIの中でも一番シンプルなinitializer injectionの例を紹介したいと思います。
            """
        case .tipProtocol:
            """
            API Clientのためのprotocolを用意して、
            """
        case .tipInit:
            """
            ItemListViewModelのinitializerの中で、APIClientProtocolをDIします。
            """
        case .tipUsage:
            """
            そして、DIされたAPIClientをシングルトンの代わりに使います
            """
        }
    }
}

struct SimpleDISampleCodeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleDISampleViewModelCodeSlide()
                .phase(.tipUsage)
        }
    }
}
