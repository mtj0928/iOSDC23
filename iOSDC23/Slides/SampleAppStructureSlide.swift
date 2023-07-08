import SwiftUI
import SlideKit

@Slide
struct SampleAppStructureSlide: View {

    enum SlidePhase: Int, PhasedState {
        case initial, tab, detail, focus
    }

    @Phase var phase: SlidePhase

    let imageHeight: CGFloat = 800

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
                .padding(.vertical, (imageHeight / 3) / 2)
                .opacity(phase == .initial ? 0.0 : 1.0)
                .overlay {
                    if phase == .initial {
                        Rectangle()
                            .foregroundStyle(.white)
                            .transition(.move(edge: .trailing))
                    }
                }
                .animation(.easeInOut(duration: 0.4), value: phase)

            VStack {
                screenBox("記事の検索").foregroundColor(.red)
                    .scaleEffect(phase == .focus ? 1.15 : 1.0 )
                    .animation(.default.speed(1.5), value: phase)
                    .zIndex(3)
                screenBox("保存済み記事の一覧").foregroundColor(.blue)
                screenBox("アカウント設定").foregroundColor(.gray)
            }
            .opacity(phase == .initial ? 0.0 : 1.0)
            .animation(.easeInOut(duration: 0.3).delay(0.5), value: phase)
            .frame(height: imageHeight)

            HStack(spacing: 48) {
                BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false)
                    .stroke(style: stroke)
                    .foregroundColor(.label)
                    .frame(width: 120)
                    .padding(.vertical, (imageHeight / 3) / 2)
                    .frame(height: imageHeight * 2 / 3, alignment: .top)
                    .opacity($phase.after(.detail) ? 1 : 0)
                    .overlay {
                        if !$phase.after(.detail) {
                            Rectangle()
                                .foregroundStyle(.white)
                                .transition(.move(edge: .trailing))
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: phase)

                screenBox("記事の詳細")
                    .foregroundColor(.orange)
                    .opacity($phase.after(.detail) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3).delay(0.4), value: phase)
            }
            .frame(height: imageHeight * 2 / 3)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: imageHeight)
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

struct BranchingLine: Shape {
    var branchCount: Int = 3
    var branchRation: CGFloat = 0.5
    var leadingToTrailing = true

    func path(in rect: CGRect) -> Path {
        Path { path in
            let minX = leadingToTrailing ? 0 : rect.maxX
            let maxX = leadingToTrailing ? rect.maxX : 0
            let maxY = rect.maxY
            path.move(to: CGPoint(x: minX, y: maxY / 2))

            let branchingPointX = rect.maxX * (leadingToTrailing ? branchRation : (1 - branchRation))
            path.addLine(to: CGPoint(x: branchingPointX, y: maxY / 2))

            for index in 0..<branchCount {
                path.move(to: CGPoint(x: branchingPointX, y: maxY / 2))

                let y = CGFloat(index) * maxY / CGFloat(branchCount - 1)
                path.addLine(to: CGPoint(x: branchingPointX, y: y))
                path.addLine(to: CGPoint(x: maxX, y: y))
            }
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
