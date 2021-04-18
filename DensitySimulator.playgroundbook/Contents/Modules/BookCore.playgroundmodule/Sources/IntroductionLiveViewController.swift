//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import AVFoundation
import PlaygroundSupport

@objc(BookCore_IntroductionLiveViewController)
public class IntroductionLiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    @IBOutlet weak var formulaContainer: UIView!
    @IBOutlet weak var rhoValue: UILabel!
    var massValue : Double = 10
    var volumeValue : Double = 10
    var music: AVAudioPlayer?
    
    public override func viewDidLoad() {
        formulaContainer.layer.cornerRadius = 15
        formulaContainer.layer.shadowOpacity = 0.5
        formulaContainer.layer.shadowOffset = CGSize(width: 3, height: 3)
        let path = Bundle.main.path(forResource: "LANDR-Equinox.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            music = try AVAudioPlayer(contentsOf: url)
            music?.play()
            music?.numberOfLoops = -1
        } catch {
            // couldn't load file :(
        }
    }
    
    /*
    public func liveViewMessageConnectionOpened() {
        // Implement this method to be notified when the live view message connection is opened.
        // The connection will be opened when the process running Contents.swift starts running and listening for messages.
    }
    */

    /*
    public func liveViewMessageConnectionClosed() {
        // Implement this method to be notified when the live view message connection is closed.
        // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
        // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
    }
    */

    public func receive(_ message: PlaygroundValue) {
        if case let .dictionary(dict) = message {
          if case let .integer(mass)? = dict["mass"] {
            massValue = Double(mass)
          }
          if case let .integer(volume)? = dict["volume"] {
            volumeValue = Double(volume)
          }
        }
        if(massValue > 0 && volumeValue > 0) {
            rhoValue.text = "ρ = \(massValue/volumeValue) Kg/m³"
        }
                 
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
    }
}
