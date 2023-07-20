import SwiftUI
import SlideKit

@Slide
struct IdeaSlide: View {
    var height: CGFloat = 800

    var body: some View {
        HStack(alignment: .center, spacing: 48) {
            VStack {
                AppIcon()
                    .frame(width: 160, height: 160)
                Text("App")
                    .footnote()
            }
            .offset(y: 30)

            BranchingLine(branchCount: 3, branchRation: 0.3)
                .stroke(style: stroke)
                .foregroundColor(.label)
                .frame(width: 240)
                .padding(.vertical, (height / 3) / 2)

            VStack {
                screenBox("記事の検索").foregroundColor(.red)
                screenBox("保存済み記事の一覧").foregroundColor(.blue)
                screenBox("アカウント設定").foregroundColor(.gray)
            }
            .frame(height: height)

            HStack(spacing: 48) {
                BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false)
                    .stroke(style: stroke)
                    .foregroundColor(.label)
                    .frame(width: 120)
                    .padding(.vertical, (height / 3) / 2)
                    .frame(height: height * 2 / 3, alignment: .top)

                screenBox("記事の詳細")
                    .foregroundColor(.orange)
            }
            .frame(height: height * 2 / 3)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: height)
        .padding(.horizontal, 48)
    }

    private func screenBox(_ text: String) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .overlay {
                Text(text)
                    .footnote()
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .opacity(0.1)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
            }
            .frame(width: 420)
            .frame(height: 150, alignment: .center)
            .frame(maxHeight: .infinity)
    }

    private var stroke: StrokeStyle {
        StrokeStyle(
            lineWidth: 3,
            lineCap: .round,
            lineJoin: .round
        )
    }
}

struct IdeaSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            IdeaSlide()
        }
    }
}
