import SwiftUI
import SlideKit

@Slide
struct PassingHardAppStructureSlide: View {
    enum Step: Int, PhasedState {
        case initial, tipA, tipB, tipC
    }

    @Phase var step: Step

    var body: some View {
        SampleAppStructure(step: .detail, highlight: highlight)
            .overlay {
                if step.isAfter(.tipC) {
                    Bubble(
                        orientation: .bottom,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.7
                    ) {
                        Text("APIClientとDBを渡す")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: -520, y: -370)
                }
            }
            .overlay {
                if step.isAfter(.tipA) {
                    Bubble(
                        orientation: .top,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.3
                    ) {
                        Text("APIClientが必要")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: -20, y: -140)
                }
            }
            .overlay {
                if step.isAfter(.tipB) {
                    Bubble(
                        orientation: .top,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.3
                    ) {
                        Text("DBが必要")
                            .footnote()
                            .padding(32)
                    }
                    .bubbleShape { shape in
                        shape
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 580, y: 0)
                }
            }
    }

    var script: String {
        switch step {
        case .initial:
            """
            QiitaViewerはこのような画面遷移を辿るアプリでした。
            """
        case .tipA:
            """
            さっき見たように記事の検索画面では、APIClientが必要でした。
            """
        case .tipB:
            """
            一方で遷移先の記事の詳細画面では、記事を保存するためにDBが必要です。
            すると、どうなるか、ですが、
            """
        case .tipC:
            """
            記事の検索画面を表示するためには、APIClientだけでなく、DBも渡す必要が出てきてしまいます。
            """
        }
    }

    var highlight: [SampleAppStructure.Highlight] {
        switch step {
        case .initial: return []
        case .tipA: return [.search]
        case .tipB: return [.detail, .search]
        case .tipC: return [.search, .detail, .path, .icon]
        }
    }

    struct HighlightableView<Content: View>: View {
        let value: Bool
        let content: () -> Content

        var body: some View {
            ZStack {
                content()
                content()
                .opacity(value ? 0.2 : 1.0)
            }
        }
    }
}

struct PassingHardAppStructureSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            PassingHardAppStructureSlide()
                .phase(.tipA)
        }
    }
}
