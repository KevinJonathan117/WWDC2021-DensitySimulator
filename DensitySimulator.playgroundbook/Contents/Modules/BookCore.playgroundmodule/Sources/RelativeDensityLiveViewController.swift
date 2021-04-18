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

@objc(BookCore_RelativeDensityLiveViewController)
public class RelativeDensityLiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    private var substanceRedValue : CGFloat?
    private var substanceGreenValue : CGFloat?
    private var substanceBlueValue : CGFloat?
    var music: AVAudioPlayer?
    
    private var relativeDensity = RelativeDensity()
    
    @IBOutlet weak var ballImage: UIView!
    @IBOutlet weak var comparationStatus: UILabel!
    
    override public func viewDidLoad() {
        ballImage.layer.cornerRadius = 18
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
            if case let .floatingPoint(substanceRedColor)? = dict["substanceRedColor"] {
              self.substanceRedValue = CGFloat(substanceRedColor)
            }
            if case let .floatingPoint(substanceGreenColor)? = dict["substanceGreenColor"] {
              self.substanceGreenValue = CGFloat(substanceGreenColor)
            }
            if case let .floatingPoint(substanceBlueColor)? = dict["substanceBlueColor"] {
              self.substanceBlueValue = CGFloat(substanceBlueColor)
            }
            if case let .integer(substanceDensity)? = dict["substanceDensity"] {
                self.relativeDensity.setSubstanceValue(_substanceValue: Double(substanceDensity))
            }
            if case let .integer(referenceDensity)? = dict["referenceDensity"] {
                self.relativeDensity.setReferenceValue(_referenceValue: Double(referenceDensity))
            }
        }
        UIView.animate(withDuration: 1) {
            self.ballImage.backgroundColor = UIColor(red: self.substanceRedValue!, green: self.substanceGreenValue!, blue: self.substanceBlueValue!, alpha: 1.0)
            for constraint in self.view.constraints {
                if constraint.identifier == "ballTop" {
                    if(self.relativeDensity.getRelativeDensityValue() > 1) {
                        constraint.constant = 222
                        self.comparationStatus.text = "ρ Substance > ρ Reference"
                    } else if(self.relativeDensity.getRelativeDensityValue() < 1) {
                        constraint.constant = 20
                        self.comparationStatus.text = "ρ Substance < ρ Reference"
                    } else {
                        constraint.constant = 128
                        self.comparationStatus.text = "ρ Substance = ρ Reference"
                    }
                }
            }
            self.view.layoutIfNeeded()
        }
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
    }
}
