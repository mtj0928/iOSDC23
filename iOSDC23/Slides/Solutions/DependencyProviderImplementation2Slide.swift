import SwiftUI
import SlideKit

@Slide
struct DependencyProviderImplementation2Slide: View {

    enum Step: Int, PhasedState {
        case initial, tipA, tipB, tipC, tipD
    }

    @Phase var step: Step

    var body: some View {
        ScrollView {
            HeaderSlide("DependencyProvider") {
                Item("Environmentから依存を取り出し、unwrapするViewを作る", accessory: 2)
                Code(
                    """
                    struct DependencyProvider<Content: View>: View {
                        @Environment(\\.dependency) var dependency

                        let content: (AppDependency) -> Content

                        var body: some View {
                            if let dependency {
                                content(dependency)
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
                            bubble {
                                Text("Environmentから依存を取り出す")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1120, y: 40)
                        }

                        if step == .tipB {
                            bubble {
                                Text("Child Viewを外から差し込む")
                                    .footnote()
                                    .padding()
                            }
                            .offset(x: 1090, y: 143)
                        }

                        if step == .tipC {
                            bubble {
                                Text("依存が注入されていれば\n依存と共にChild Viewを出す")
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
                                .frame(width: 1130, height: 60)
                                .offset(y: 45)
                        }

                        if step == .tipB {
                            highlightView
                                .frame(width: 1100, height: 60)
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
        _ content: @escaping () -> some View
    ) -> some View {
        Bubble(
            orientation: orientation,
            tipSize: tipSize
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
}

struct DependencyProviderImplementation2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            DependencyProviderImplementation2Slide()
                .phase(.tipB)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
