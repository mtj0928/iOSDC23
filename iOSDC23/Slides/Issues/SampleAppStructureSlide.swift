import SwiftUI
import SlideKit

@Slide
struct SampleAppStructureSlide: View {

    enum Step: Int, PhasedState {
        case initial, focus
    }

    @Phase var step: Step

    var body: some View {
        SampleAppStructure(step: .detail, highlight: highlight, scale: scale)
    }

    var highlight: [SampleAppStructure.Highlight] {
        switch step {
        case .initial: return []
        case .focus: return [.search]
        }
    }

    var scale: SampleAppStructure.Scale? {
        switch step {
        case .initial: return nil
        case .focus: return .search
        }
    }

    var script: String {
        switch step {
        case .initial:
            """
            アプリとしては、3つのタブがあります。
            上から、記事の検索タブ、保存済み記事の一覧タブ、アカウント設定タブです。
            そして今見たように、記事の検索タブ、保存済み記事の一覧のタブからは、記事の詳細な画面を確認できます。
            """
        case .focus:
            """
            では、この記事の検索タブの実装をみてみましょう。
            """
        }
    }
}


struct SampleAppStructureSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SampleAppStructureSlide()
        }
    }
}
