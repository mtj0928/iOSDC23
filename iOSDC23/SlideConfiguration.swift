//
//  SlideConfiguration.swift
//
//  This file is automatically generated by SlideGen
//

import SwiftUI
import SlideKit

struct SlideConfiguration {

    /// Edit the slide size.
    let size = SlideSize.standard16_9

    ///  Add your slides into the trailing closure.
    let slideIndexController = SlideIndexController {
        TitleSlide()
        XcodePreviewSlide()
        SampleAppSlide()
        SampleAppStructureSlide()
        SearchScreenCaptureSlide()
        SimpleSampleViewCodeSlide()
        SimpleSampleCode.previewCode
        SimpleImplementationIssueSlide()
        CenterTitleSlide("Dependency Injection")
        SimpleDISampleViewModelCodeSlide()
        SimpleDISampleViewCodeSlide()
        SimpleDIMockSlide()
        InitInjectionSlide()
        PassingHardAppStructureSlide()
        BaketsuRelayIssueSlide()
        BaketsuRelayIssue2Slide()
        CenterTitleSlide("@Environment\n@EnvironmentObject")
        EnvironmentSlide()
        EnvironmentIssue1Slide()
        EnvironmentIssue2Slide()
    }
}
