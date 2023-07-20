import SwiftUI
import SlideKit

struct SampleAppStructure: View {
    enum Step: Int, PhasedState {
        case initial, tab, detail
    }

    enum Highlight {
        case search, detail
    }

    enum Scale {
        case search
    }

    let step: Step

    var highlight: Highlight? = nil
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
                if highlight != nil {
                    Color.white.padding(-40)
                        .opacity(0.8)
                }
            }
            .offset(y: 30)

            BranchingLine(branchCount: 3, branchRation: 0.3)
                .stroke(style: stroke)
                .foregroundColor(.label)
                .frame(width: 240)
                .padding(.vertical, (height / 3) / 2)
                .opacity(step == .initial ? 0.0 : 1.0)
                .overlay {
                    if step == .initial {
                        Rectangle()
                            .foregroundStyle(.white)
                            .transition(.move(edge: .trailing))
                    }
                }
                .animation(.easeInOut(duration: 0.4), value: step)
                .overlay {
                    if highlight != nil {
                        Color.white.padding(-4)
                            .opacity(0.8)
                    }
                }

            VStack {
                screenBox("記事の検索").foregroundColor(.red)
                    .scaleEffect(scale == .search ? 1.15 : 1.0 )
                    .animation(.default.speed(1.5), value: scale)
                    .zIndex(3)
                    .overlay {
                        if highlight != nil && highlight != .search {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
                screenBox("保存済み記事の一覧")
                    .foregroundColor(.blue)
                    .overlay {
                        if highlight != nil {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
                screenBox("アカウント設定")
                    .foregroundColor(.gray)
                    .overlay {
                        if highlight != nil {
                            Color.white.padding(-4)
                                .opacity(0.8)
                        }
                    }
            }
            .opacity(step == .initial ? 0.0 : 1.0)
            .animation(.easeInOut(duration: 0.3).delay(0.5), value: step)
            .frame(height: height)

            HStack(spacing: 48) {
                BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false)
                    .stroke(style: stroke)
                    .foregroundColor(.label)
                    .frame(width: 120)
                    .padding(.vertical, (height / 3) / 2)
                    .frame(height: height * 2 / 3, alignment: .top)
                    .opacity(step.isAfter(.detail) ? 1 : 0)
                    .overlay {
                        if !step.isAfter(.detail) {
                            Rectangle()
                                .foregroundStyle(.white)
                                .transition(.move(edge: .trailing))
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: step)
                    .overlay {
                        if highlight != nil {
                            Color.white.padding(-10)
                                .opacity(0.8)
                        }
                    }

                screenBox("記事の詳細")
                    .foregroundColor(.orange)
                    .opacity(step.isAfter(.detail) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3).delay(0.4), value: step)
                    .overlay {
                        if highlight != nil && highlight != .detail {
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
                SampleAppStructure(step: .detail, highlight: .search)
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
