import SwiftUI
import SlideKit

@Slide
struct SampleAppStructureSlide: View {

    enum Step: Int, PhasedState {
        case initial, tab, detail, focus
    }

    @Phase var step: Step

    var body: some View {
        SampleAppStructure(step: childStep, highlight: highlight, scale: scale)
    }

    var childStep: SampleAppStructure.Step {
        switch step {
        case .initial: return .initial
        case .tab: return .tab
        case .detail: return .detail
        case .focus: return .detail
        }
    }

    var highlight: SampleAppStructure.Highlight? {
        switch step {
        case .initial, .tab, .detail: return nil
        case .focus: return .search
        }
    }

    var scale: SampleAppStructure.Scale? {
        switch step {
        case .initial, .tab, .detail: return nil
        case .focus: return .search
        }
    }
}


struct SampleAppStructureSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SampleAppStructureSlide()
                .phase(.detail)
        }
    }
}
