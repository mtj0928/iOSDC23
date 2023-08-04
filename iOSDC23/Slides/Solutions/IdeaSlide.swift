import SwiftUI
import SlideKit

@Slide
struct IdeaSlide: View {
    enum Step: Int, PhasedState {
        case initial, step1, step2, initializer, environment
    }

    @Phase var step: Step

    var height: CGFloat = 900
    let spacing: CGFloat = 48

    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            VStack {
                AppIcon()
                    .frame(width: 160, height: 160)
                Text("App")
                    .footnote()
            }
            .overlay {
                if step.isAfter(.initializer) {
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
                .background {
                    if step.isAfter(.step2) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(
                                lineWidth: 3,
                                lineCap: .round,
                                dash: [15, 10]
                            ))
                            .padding(.horizontal, -12)
                            .foregroundStyle(.gray)
                            .overlay(alignment: .topLeading) {
                                Text("関心外")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundStyle(Color.label)
                                    .padding(6)
                            }
                    }
                }
                .opacity(step.isAfter(.initializer) ? 0.2 : 1.0)

            VStack(spacing: spacing) {
                screenBox("記事の検索")
                    .foregroundColor(.red)
                    .overlay {
                        if step.isAfter(.initializer) {
                            Bubble(
                                orientation: .trailing,
                                tipSize: CGSize(width: 30, height: 15)
                            ) {
                                Text("Initializer Injection")
                                    .footnote()
                                    .padding(32)
                            }
                            .bubbleShape { shape in
                                shape.stroke(lineWidth: 2)
                                    .foregroundStyle(Color.label)
                            }
                            .foregroundStyle(.white)
                            .offset(x: -420, y: 0)
                        }
                    }
                screenBox("保存済み記事の一覧").foregroundColor(.blue)
                    .opacity(step.isAfter(.initializer) ? 0.2 : 1.0)
                screenBox("アカウント設定").foregroundColor(.gray)
                    .opacity(step.isAfter(.initializer) ? 0.2 : 1.0)
            }
            .frame(height: height)

            HStack(spacing: spacing) {
                BranchingLine(branchCount: 2, branchRation: 0.5, leadingToTrailing: false)
                    .stroke(style: stroke)
                    .foregroundColor(.label)
                    .frame(width: 120)
                    .padding(.vertical, (height / 3) / 2)
                    .frame(height: height * 2 / 3, alignment: .top)
                    .background {
                        if step.isAfter(.step2) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(
                                    lineWidth: 3,
                                    lineCap: .round,
                                    dash: [15, 10]
                                ))
                                .padding(.horizontal, -12)
                                .foregroundStyle(.gray)
                                .overlay(alignment: .topLeading) {
                                    Text("関心外")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundStyle(Color.label)
                                        .padding(6)
                                }
                        }
                    }
                    .opacity(step.isAfter(.initializer) && !step.isAfter(.environment) ? 0.2 : 1.0)
                    .overlay {
                        if step.isAfter(.environment) {
                            Bubble(
                                orientation: .leading,
                                tipSize: CGSize(width: 30, height: 15),
                                tipPositionRatio: 0.5
                            ) {
                                Text("@Environment")
                                    .footnote()
                                    .padding(32)
                            }
                            .bubbleShape { shape in
                                shape.stroke(lineWidth: 2)
                                    .foregroundStyle(Color.label)
                            }
                            .foregroundStyle(.white)
                            .offset(x: 240, y: -220)
                            .zIndex(100)
                        }
                    }
                    .zIndex(1)
                screenBox("記事の詳細")
                    .foregroundColor(.orange)
                    .frame(height: height / 3 - spacing / 2, alignment: .top)
                    .opacity(step.isAfter(.initializer) ? 0.2 : 1.0)
            }
            .frame(height: height * 2 / 3)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: height)
        .padding(.horizontal, 48)
    }

    private func screenBox(_ text: String) -> some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round
                    ))
                    .foregroundStyle(Color.blue)
                Text("関心内")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(Color.label)
                    .padding(6)
                    .padding(.leading, 6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(width: 500)
            .opacity(step.isAfter(.step1) ? 1.0 : 0.0)

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
                .frame(width: 420)
                .frame(height: 150, alignment: .center)
                .frame(maxHeight: .infinity)
        }
    }

    private var stroke: StrokeStyle {
        StrokeStyle(
            lineWidth: 3,
            lineCap: .round,
            lineJoin: .round
        )
    }

    var script: String {
        switch step {
        case .initial:
            "再度QiitaViewerのアプリの画面構造を見てみましょう"
        case .step1:
            """
            各画面は独立して、Xcode Previewで動作確認したい関心です。
            """
        case .step2:
            """
            一方で、各画面間がどうなっているのかは多くの場合、Xcode Previewの関心の対象外だと考えられます。
            そしてこのXcode PreviewでPreviewしたい対象かどうかで異なるDIのアプローチを取ります。
            """
        case .initializer:
            """
            Xcode Previewの関心の範囲について、Initializer Injectionを、
            """
        case .environment:
            """
            Xcode Previewの関心の範囲外について、Environmentを使ったDIを行います。
            """
        }
    }
}

struct IdeaSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            IdeaSlide()
                .phase(.environment)
        }
    }
}
