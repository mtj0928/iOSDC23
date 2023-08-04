import SwiftUI
import SlideKit

@Slide
struct DependencyProviderImplementation3Slide: View {

    enum Step: Int, PhasedState {
        case initial, tipA, tipB, tipC, tipD
    }

    @Phase var step: Step

    var body: some View {
        ScrollView {
            HeaderSlide("DependencyProvider") {
                Item("Environmentから依存を取り出し、unwrapするViewを作る", accessory: 3)
                Code(
                    """
                    struct DependencyProvider<ChildView: View>: View {
                        @Environment(\\.dependency) var dependency: AppDependency?

                        let childView: (AppDependency) -> ChildView

                        var body: some View {
                            if let dependency {
                                childView(dependency)
                            } else {
                    #if DEBUG
                                Text("Dependency is not set.")
                                    // ...
                                    .background(.red)
                    #endif
                            }
                        }
                    }
                    """,
                    fontSize: 40
                )
                .lineSpacing(4)
                .overlay(alignment: .topLeading) {
                    ZStack(alignment: .topLeading) {
                        if step == .tipA {
                            bubble(
                                orientation: .bottom,
                                tipSize: CGSize(width: 20, height: 30),
                                tipPostionRatio: 0.2
                            ) {
                                Text("Environmentから\n依存を取り出す")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1400, y: -105)
                        }

                        if step == .tipB {
                            bubble {
                                Text("ChildViewを外から差し込む")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1190, y: 143)
                        }

                        if step == .tipC {
                            bubble {
                                Text("依存が注入されていれば\n依存と共にChildViewを出す")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1090, y: 316)
                        }

                        if step == .tipD {
                            bubble {
                                Text("依存が注入されていなかったら\nそのことを表示する")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1090, y: 523)
                        }
                    }
                }
                .background(alignment: .topLeading) {
                    ZStack(alignment: .topLeading) {
                        if step == .tipA {
                            highlightView
                                .frame(width: 1530, height: 60)
                                .offset(y: 45)
                        }

                        if step == .tipB {
                            highlightView
                                .frame(width: 1200, height: 60)
                                .offset(y: 150)
                        }

                        if step == .tipC {
                            highlightView
                                .frame(width: 1100, height: 155)
                                .offset(y: 304)
                        }

                        if step == .tipD {
                            highlightView
                                .frame(width: 1100, height: 155)
                                .offset(y: 508)
                        }
                    }
                }
                .animation(nil, value: step == .tipD)
            }
        }
        .padding(.top, step == .tipD ? -150 : 0)
        .animation(.easeInOut, value: step == .tipD)
    }

    private func bubble(
        orientation: BubbleOrientation = .leading,
        tipSize: CGSize = CGSize(width: 40, height: 15),
        tipPostionRatio: CGFloat = 0.5,
        _ content: @escaping () -> some View
    ) -> some View {
        Bubble(
            orientation: orientation,
            tipSize: tipSize,
            tipPositionRatio: tipPostionRatio
        ) {
            content()
        }
        .bubbleShape { shape in
            shape.stroke(lineWidth: 2)
                .foregroundStyle(Color.label)
        }
        .foregroundStyle(.white)
    }

    private var highlightView: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue.opacity(0.05))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.blue)
            }
    }

    var script: String {
        switch step {
        case .initial:
            "最後にEnvironmentから依存を取り出して、unwrapするDependencyProviderというViewを追加します。"
        case .tipA:
            """
            Environmentから先ほど定義したAppDependencyを取り出します。
            EnvironmentにDependencyが設定されていない場合、この値はnilになります。
            """
        case .tipB:
            """
            また、外からクロージャーを受け取ります。
            このクロージャーはAppDependencyを受け取って、ChildViewを返します。
            ChildViewはジェネリクスなので、呼び出し側で実際の型は指定できます。
            ここで渡すDependencyはoptionalkではないことに注目してください。
            """
        case .tipC:
            """
            では、DependencyProviderのbodyの中身も見ていきましょう。
            Environmentから取り出したdependencyが値を持っていた場合、そのdependencyをchildViewに渡すだけです。
            """
        case .tipD:
            """
            もしEnvironmentから取り出したdependencyがnilだった場合は、そのことをTextで表示させます。
            依存が設定されていないことはアプリとしては望ましいことではないので、そのことを知らせるために派手な見た目にしておくと良いです。

            これで、DependencyProviderの実装は完了です。
            次にこのDependencyProviderをどう使うのか説明していきます。
            """
        }
    }
}

struct DependencyProviderImplementation3Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderImplementation3Slide()
                .phase(.tipA)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
