import SwiftUI
import SlideKit

@Slide
struct HowToUseDependencyProvider2Slide: View {
    enum Step: Int, PhasedState {
        case initial, tip, tipA, tipB
    }

    @Phase var step: Step

    var body: some View {
        HeaderSlide("DependencyProviderの使い方") {
            Item("他のViewを表示する時、Dependency Providerを挟んで依存を解決する", accessory: 2)
            Code(code, fontSize: 40)
                .lineSpacing(4)
                .overlay(alignment: .topLeading) {
                    ZStack(alignment: .topLeading) {
                        if step == .tip {
                            Bubble(tipSize: CGSize(width: 30, height: 15)) {
                                Text("まずDependencyProviderを呼ぶ")
                                    .footnote()
                                    .padding()
                            }
                            .bubbleShape { shape in
                                shape.stroke(lineWidth: 2)
                                    .foregroundStyle(Color.label)
                            }
                            .foregroundStyle(.white)
                            .offset(x: 845, y: 140)
                        }
                        if step == .tipA {
                            Bubble(tipSize: CGSize(width: 30, height: 15)) {
                                Text("依存が渡される")
                                    .footnote()
                                    .padding()
                            }
                            .bubbleShape { shape in
                                shape.stroke(lineWidth: 2)
                                    .foregroundStyle(Color.label)
                            }
                            .foregroundStyle(.white)
                            .offset(x: 975, y: 140)
                        }

                        if step == .tipB {
                            Bubble(tipSize: CGSize(width: 30, height: 15)) {
                                Text("渡された依存を使って\nChild Viewを作る")
                                    .footnote()
                                    .padding()
                            }
                            .bubbleShape { shape in
                                shape.stroke(lineWidth: 2)
                                    .foregroundStyle(Color.label)
                            }
                            .foregroundStyle(.white)
                            .offset(x: 1135, y: 240)
                        }
                    }
                }
                .background(alignment: .topLeading) {
                    ZStack(alignment: .topLeading) {
                        if step == .tip { 
                            highlightBackground
                                .frame(width: 690, height: 320)
                                .offset(x: 170, y: 150)
                        }
                        if step == .tipA {
                            highlightBackground
                                .frame(width: 280, height: 60)
                                .offset(x: 700, y: 150)
                        }

                        if step == .tipB {
                            highlightBackground
                                .frame(width: 860, height: 210)
                                .offset(x: 280, y: 200)
                        }
                    }
                }
        }
    }

    var code: String {
        switch step {
        case .initial:
            """
            var body: some View {
                ...
                .navigationDestination(for: Item.self) { item in






                }
            }
            """
        case .tip:
            """
            var body: some View {
                ...
                .navigationDestination(for: Item.self) { item in
                    DependencyProvider {




                    }
                }
            }
            """
        case .tipA:
            """
            var body: some View {
                ...
                .navigationDestination(for: Item.self) { item in
                    DependencyProvider { dependency in




                    }
                }
            }
            """
        case .tipB:
            """
            var body: some View {
                ...
                .navigationDestination(for: Item.self) { item in
                    DependencyProvider { dependency in
                        ItemDetailView(
                            item,
                            database: dependency.database
                        )
                    }
                }
            }
            """
        }
    }

    private var highlightBackground: some View {
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
            """
            他のViewを表示するときはさっき作ったDependencyProviderを挟んで表示をします。
            navigationDestinationを使って画面遷移する例を見てみましょう。
            コードを見てみると、遷移するために必要なitemが渡されています。
            """
        case .tip: 
            """
            まずはシンプルにDependencyProviderを呼びます。
            """
        case .tipA:
            """
            DependencyProviderのtrailing closureには必要な依存が渡されます。
            DependencyProviderの実装でみたように、ここではunwrapされたnon-optionalな値として渡されます。
            """
        case .tipB:
            """
            そして、渡された依存を元に遷移先のViewを作ります。
            """
        }
    }
}

struct HowToUseDependencyProvider2Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            HowToUseDependencyProvider2Slide()
                .phase(.tip)
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
