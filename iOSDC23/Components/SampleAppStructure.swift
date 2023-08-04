import SwiftUI
import SlideKit

struct SampleAppStructure: View {
    enum Step: Int, PhasedState {
        case initial, tab, detail
    }

    enum Highlight {
        case search, detail, icon, path
    }

    enum Scale {
        case search
    }

    let step: Step

    var highlight: [Highlight] = []
    var scale: Scale?
    var height: CGFloat = 800

    var body: some View {
        HStack(alignment: .center, spacing: 48) {
            VStack {
                AppIcon()
                    .frame(width: 160, height: 160)
                Text("App")
                    .footnote()
            }
            .overlay {
                if !highlight.contains(.icon) && !highlight.isEmpty {
                    Color.white.padding(-40)
                        .opacity(0.8)
                }
            }
            .offset(y: 30)

            BranchingLine(branchCount: 3, branchRation: 0.3)
                .stroke(style: stroke)
                .foregroundColor(.label)
                .overlay {
                    if !highlight.isEmpty {
                        Color.white.padding(-4)
                            .opacity(0.8)
                    }
                }
                .opacity(step == .initial ? 0.0 : 1.0)
                .overlay {
                    if !highlight.isEmpty && highlight.contains(.path) {
                        BranchingLine(branchCount: 3, branchRation: 0.3) { index in
                            index == 0
                        }
                        .stroke(style:  StrokeStyle(
                            lineWidth: 6,
                            lineCap: .round,
                            lineJoin: .round
                        ))
                        .foregroundStyle(.red)
                    }
                }
                .frame(width: 240)
                .padding(.vertical, (height / 3) / 2)

            VStack {
                screenBox("記事の検索").foregroundColor(.red)
                    .scaleEffect(scale == .search ? 1.15 : 1.0 )
                    .zIndex(3)
                    .overlay {
                        if !highlight.contains(.search) && !highlight.isEmpty {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
                screenBox("保存済み記事の一覧")
                    .foregroundColor(.blue)
                    .overlay {
                        if !highlight.isEmpty {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
                screenBox("アカウント設定")
                    .foregroundColor(.gray)
                    .overlay {
                        if !highlight.isEmpty {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
            }
            .opacity(step == .initial ? 0.0 : 1.0)
            .frame(height: height)

            HStack(spacing: 48) {
                BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false)
                    .stroke(style: stroke)
                    .foregroundColor(.label)
                    .overlay {
                        if !highlight.isEmpty {
                            Color.white.padding(-10)
                                .opacity(0.8)
                        }
                    }
                    .overlay {
                        if !highlight.isEmpty && highlight.contains(.path) {
                            BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false) { index in
                                index == 0
                            }
                            .stroke(style:  StrokeStyle(
                                lineWidth: 6,
                                lineCap: .round,
                                lineJoin: .round
                            ))
                            .foregroundStyle(.red)
                        }
                    }
                    .frame(width: 120)
                    .padding(.vertical, (height / 3) / 2)
                    .frame(height: height * 2 / 3, alignment: .top)
                    .opacity(step.isAfter(.detail) ? 1 : 0)

                screenBox("記事の詳細")
                    .foregroundColor(.orange)
                    .opacity(step.isAfter(.detail) ? 1 : 0)
                    .overlay {
                        if !highlight.contains(.detail) && !highlight.isEmpty {
                            Color.white.padding(-10)
                                .opacity(0.8)
                        }
                    }
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

struct SampleAppStructure_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            SlideAdapter {
                SampleAppStructure(step: .detail, highlight: [.search, .icon])
            }
        }
    }
}

@Slide
struct SlideAdapter<Content: View>: View {
    let content: () -> Content

    var body: some View {
        content()
    }
}
