//
//  iOSDC23App.swift
//
//  This file is automatically generated by SlideGen
//

import SwiftUI
import SlideKit

@main
struct iOSDC23App: App {

    @Environment(\.openWindow) var openWindow

    /// Edit slide configurations in SlideConfiguration.swift
    private static let configuration = SlideConfiguration()

    /// A presentation content view.
    /// Edit the view here if you'd like to set environments, overlay views or background views.
    var presentationContentView: some View {
        SlideRouterView(slideIndexController: Self.configuration.slideIndexController)
            .background(.white)
            .foregroundColor(.label)
            .headerSlideStyle(CustomHeaderSlideStyle())
            .itemStyle(CustomItemStyle())
    }

    @AppStorage("last.index")
    var lastIndex: Int = 0

    init() {
        let count = Self.configuration.slideIndexController.slides.count
        Self.configuration.slideIndexController.move(
            to: max(min(count - 1, lastIndex), 0))
    }

    var body: some Scene {
        WindowGroup {
            PresentationView(slideSize: Self.configuration.size) {
                presentationContentView
            }
            .onReceive(Self.configuration.slideIndexController.$currentIndex) { index in
                lastIndex = index
            }
        }
        .setupAsPresentationWindow(Self.configuration.slideIndexController) {
            openWindow(id: "presenter")
        }
        .addPDFExportCommands(for: presentationContentView, with: Self.configuration.slideIndexController, size: Self.configuration.size)

        WindowGroup(id: "presenter") {
            macOSPresenterView(
                slideSize: Self.configuration.size,
                slideIndexController: Self.configuration.slideIndexController
            ) {
                presentationContentView
            }
        }
        .setupAsPresenterWindow()
    }
}
