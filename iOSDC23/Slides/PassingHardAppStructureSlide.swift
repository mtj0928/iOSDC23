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
                        orientation: .top,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.3
                    ) {
                        (Text("APIClientと") + Text("DB").foregroundColor(.red) + Text("が必要"))
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
                } else if step.isAfter(.tipA) {
                    Bubble(
                        orientation: .top,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.3
                    ) {
                        Text("APIClientが必要")
                            .footnote()
                            .padding(32)
                            .opacity(step.isAfter(.tipB) ? 0.2 : 1.0)
                    }
                    .bubbleShape { shape in
                        shape
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                            .opacity(step.isAfter(.tipB) ? 0.2 : 1.0)
                    }
                    .foregroundStyle(.white)
                    .offset(x: -20, y: -140)
                }
            }.overlay {
                if step.isAfter(.tipB) {
                    Bubble(
                        orientation: .top,
                        tipSize: CGSize(width: 20, height: 40),
                        tipPositionRatio: 0.3
                    ) {
                        Text("DBが必要")
                            .footnote()
                            .padding(32)
                            .opacity(step.isAfter(.tipC) ? 0.2 : 1.0)
                    }
                    .bubbleShape { shape in
                        shape
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.label)
                            .opacity(step.isAfter(.tipC) ? 0.2 : 1.0)
                    }
                    .foregroundStyle(.white)
                    .offset(x: 580, y: 0)
                }
            }
    }

    var highlight: SampleAppStructure.Highlight? {
        switch step {
        case .initial: return nil
        case .tipA: return .search
        case .tipB: return .detail
        case .tipC: return .search
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
                .phase(.tipC)
        }
    }
}
