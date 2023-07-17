import SwiftyGif
import SwiftUI

struct GIFImage: NSViewRepresentable {
    let name: String

    func makeCoordinator() -> GIFImageCoordinator {
        let image = try! NSImage(gifName: name)
        return GIFImageCoordinator(image: image)
    }

    func makeNSView(context: Context) -> NSImageView {
        let imageView = NSImageView(gifImage: context.coordinator.image, loopCount: 1)
        imageView.imageScaling = .scaleProportionallyDown
        return imageView
    }

    func sizeThatFits(_ proposal: ProposedViewSize, nsView: NSImageView, context: Context) -> CGSize? {
        let image = context.coordinator.image
        let height = proposal.height ?? 1.0
        return CGSize(
            width: height * image.gifImageSize.width / image.gifImageSize.height,
            height: height
        )
    }

    func updateNSView(_ imageView: NSImageView, context: Context) {
    }

    class GIFImageCoordinator {
        let image: NSImage

        init(image: NSImage) {
            self.image = image
        }
    }
}

extension NSImage {
    var gifImageSize: CGSize {
        guard let imageSource = imageSource,
              let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            return .zero
        }

        return NSImage(cgImage: cgImage, size: .zero).size
    }
}
