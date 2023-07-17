import SwiftUI

struct Bubble<Content: View>: View {
    var orientation: BubbleOrientation = .leading
    var tipSize: CGSize = CGSize(width: 20, height: 10)
    var tipPositionRatio: CGFloat = 0.5
    var cornerRadius: CGFloat = 10
    let content: () -> Content

    var body: some View {
        Group {
            switch orientation {
            case .top:
                VStack(spacing: .zero) {
                    Color.clear.frame(height: tipSize.height)
                    content()
                }
            case .leading:
                HStack(spacing: .zero) {
                    Color.clear.frame(width: tipSize.width)
                    content()
                }
            case .trailing:
                HStack(spacing: .zero) {
                    content()
                    Color.clear.frame(width: tipSize.width)
                }
            case .bottom:
                VStack(spacing: .zero) {
                    content()
                    Color.clear.frame(height: tipSize.height)
                }
            }
        }
        .background {
            BubbleShape(orientation: orientation, tipSize: tipSize, tipPositionRatio: tipPositionRatio, cornerRadius: cornerRadius)
        }
        .fixedSize()
    }
}

extension Bubble {
    func bubbleShape(@ViewBuilder _ content: (BubbleShape) -> some View) -> some View {
        self.overlay {
            let shape = BubbleShape(
                orientation: orientation,
                tipSize: tipSize,
                tipPositionRatio: tipPositionRatio,
                cornerRadius: cornerRadius
            )
            content(shape)
        }
    }
}

enum BubbleOrientation {
    case top, leading, trailing, bottom
}

struct BubbleShape: Shape {
    var orientation: BubbleOrientation
    var tipSize: CGSize = CGSize(width: 20, height: 10)
    var tipPositionRatio: CGFloat = 0.5
    var cornerRadius: CGFloat = 10

    func path(in rect: CGRect) -> Path {
        let tipPath: Path
        let roundPath: Path

        switch orientation {
        case .top:
            tipPath = BubbleTipShape(
                orientation: orientation,
                tipSize: tipSize,
                tipPositionRatio: tipPositionRatio
            ).path(in: CGRect(
                origin: rect.origin,
                size: CGSize(
                    width: rect.width,
                    height: tipSize.height
                )
            ))
            roundPath = Path(roundedRect: CGRect(
                x: rect.minX,
                y: rect.minY + tipSize.height,
                width: rect.width,
                height: rect.height - tipSize.height
            ), cornerRadius: cornerRadius)
        case .leading:
            tipPath = BubbleTipShape(
                orientation: orientation,
                tipSize: tipSize,
                tipPositionRatio: tipPositionRatio
            ).path(in: CGRect(
                origin: rect.origin,
                size: CGSize(
                    width: tipSize.width, height: rect.height
                )
            ))
            roundPath = Path(roundedRect: CGRect(
                x: tipSize.width + rect.minX,
                y: rect.minY,
                width: rect.width - tipSize.width,
                height: rect.height
            ), cornerRadius: cornerRadius)
        case .trailing:
            tipPath = BubbleTipShape(
                orientation: orientation,
                tipSize: tipSize,
                tipPositionRatio: tipPositionRatio
            ).path(in: CGRect(
                origin: CGPoint(
                    x: rect.maxX - tipSize.width,
                    y: rect.minY
                ),
                size: CGSize(
                    width: tipSize.width, height: rect.height
                )
            ))
            roundPath = Path(roundedRect: CGRect(
                x: rect.minX,
                y: rect.minY,
                width: rect.width - tipSize.width,
                height: rect.height
            ), cornerRadius: cornerRadius)
        case .bottom:
            tipPath = BubbleTipShape(
                orientation: orientation,
                tipSize: tipSize,
                tipPositionRatio: tipPositionRatio
            ).path(in: CGRect(
                origin: CGPoint(
                    x: rect.minX,
                    y: rect.maxY - tipSize.height
                ),
                size: CGSize(
                    width: rect.width,
                    height: tipSize.height
                )
            ))
            roundPath = Path(roundedRect: CGRect(
                x: rect.minX,
                y: rect.minY,
                width: rect.width,
                height: rect.height - tipSize.height
            ), cornerRadius: cornerRadius)
        }

        let combinedCGPath = roundPath.cgPath.union(tipPath.cgPath)
        let combinedPath = Path(combinedCGPath)
        return combinedPath
    }
}

struct BubbleTipShape: Shape {
    var orientation: BubbleOrientation
    var tipSize: CGSize
    var tipPositionRatio: CGFloat

    func path(in rect: CGRect) -> Path {
        Path({ path in
            switch orientation {
            case .top:
                let positionX = rect.minX + rect.width * tipPositionRatio
                path.move(to: CGPoint(x: positionX, y: rect.minY))
                path.addLine(to: CGPoint(x: positionX - tipSize.width / 2, y: rect.maxY))
                path.addLine(to: CGPoint(x: positionX + tipSize.width / 2, y: rect.maxY))
            case .leading:
                let positionY = rect.minY + rect.height * tipPositionRatio
                path.move(to: CGPoint(x: rect.minX, y: positionY))
                path.addLine(to: CGPoint(x: rect.maxX, y: positionY - tipSize.height / 2))
                path.addLine(to: CGPoint(x: rect.maxX, y:  positionY + tipSize.height / 2))
                path.closeSubpath()
            case .trailing:
                let positionY = rect.minY + rect.height * tipPositionRatio
                path.move(to: CGPoint(x: rect.maxX, y: positionY))
                path.addLine(to: CGPoint(x: rect.minX, y: positionY - tipSize.height / 2))
                path.addLine(to: CGPoint(x: rect.minX, y: positionY + tipSize.height / 2))
            case .bottom:
                let positionX = rect.minX + rect.width * tipPositionRatio
                path.move(to: CGPoint(x: positionX, y: rect.maxY))
                path.addLine(to: CGPoint(x: positionX - tipSize.width / 2 , y: rect.minY))
                path.addLine(to: CGPoint(x: positionX + tipSize.width / 2, y: rect.minY))
            }
        })
    }
}

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            let content: some View = {
                Text("Hoge")
                    .foregroundStyle(.black)
                    .padding(8)
            }()
            Bubble(
                orientation: .top,
                tipSize: CGSize(width: 5, height: 10),
                tipPositionRatio: 0.2,
                cornerRadius: 1
            ) {
                content
            }

            Bubble(orientation: .leading) {
                content
            }

            Bubble(orientation: .trailing) {
                content
            }

            Bubble(orientation: .bottom, tipSize: CGSize(width: 10, height: 15)) {
                content
            }
            .fixedSize()
        }
        .padding()
    }
}
