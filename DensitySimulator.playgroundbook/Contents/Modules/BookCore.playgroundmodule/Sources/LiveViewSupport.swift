//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `IntroductionLiveViewController` from `IntroductionLiveView.storyboard`.
public func instantiateIntroductionLiveView() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "IntroductionLiveView", bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? IntroductionLiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `DensityLiveViewController` from `DensityLiveView.storyboard`.
public func instantiateDensityLiveView() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "DensityLiveView", bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? DensityLiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `RelativeDensityLiveViewController` from `RelativeDensityLiveView.storyboard`.
public func instantiateRelativeDensityLiveView() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "RelativeDensityLiveView", bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? RelativeDensityLiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}
