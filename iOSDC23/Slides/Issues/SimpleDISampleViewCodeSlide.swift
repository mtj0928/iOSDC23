import SwiftUI
import SlideKit

@Slide
struct SimpleDISampleViewCodeSlide: View {

    enum Step: Int, PhasedState {
        case initial, tipInit
    }

    @Phase var step: Step

    var body: some View {
        CodeSlide(
        """
        struct ItemListView: View {
            @StateObject let viewModel: ItemListViewModel

            var body: some View {
                // viewModelのitemsを使ってリストを表示する
            }
        }
        """
        )
        .background(alignment: .leading) {
            if step.isAfter(.tipInit) {
                CodeHighlightBackground(width: 1280, height: 58, y: -364)
            }
        }
        .overlay(alignment: .leading) {
            if step.isAfter(.tipInit) {
                Bubble(tipSize: CGSize(width: 60, height: 20), cornerRadius: 10) {
                    Text("ViewModelを外から差し込む")
                        .footnote()
                        .padding(32)
                }
                .bubbleShape { shape in
                    shape.stroke(lineWidth: 2)
                        .foregroundStyle(Color.label)
                }
                .foregroundStyle(.white)
                .offset(x: 1280, y: -365)
            }
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            そして、ItemListViewでは、
            """
        case .tipInit:
            """
            ItemListViewModelを内部で生成するのをやめて、外からDIするようにします。
            """
        }
    }
}

struct SimpleDISampleViewCodeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SimpleDISampleViewCodeSlide()
                .phase(.tipInit)
        }
    }
}
