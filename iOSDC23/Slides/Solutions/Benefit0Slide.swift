import SwiftUI
import SlideKit

@Slide
struct Benefit0Slide: View {
    var body: some View {
        HeaderSlide("DependencyProviderの何が嬉しいか") {
            Item("どのViewからでも依存が取り出せる", accessory: 1) {
                Item("non-optionalな値として取り出せる")
            }

            Code(
                """
                struct FooView: View {
                    var body: some View {
                        NavigationLink("次の画面へ") {
                            DependencyProvider { dependency in
                                NextView(database: dependency.database)
                            }
                        }
                    }
                }
                """,
                fontSize: 40
            )
            .lineSpacing(4)
        }
    }
}

struct Benefit0Slide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            Benefit0Slide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
