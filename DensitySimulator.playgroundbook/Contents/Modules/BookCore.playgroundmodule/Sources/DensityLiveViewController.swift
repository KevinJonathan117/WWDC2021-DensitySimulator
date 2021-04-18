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

@objc(BookCore_DensityLiveViewController)
public class DensityLiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    @IBOutlet weak var densityLevelLabel: UILabel!
    @IBOutlet weak var cubeImage: UIImageView!
    @IBOutlet weak var massSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    var music: AVAudioPlayer?
    
    private var density = Density()
    
    @IBAction func massValueChanged(_ sender: UISlider) {
        density.setMassValue(_massValue: round(Double(sender.value)))
        updateDensityStatus()
    }
    @IBAction func volumeValueChanged(_ sender: UISlider) {
        density.setVolumeValue(_volumeValue: round(Double(sender.value)))
        updateDensityStatus()
    }
    override public func viewDidLoad() {
        self.massLabel.alpha = 0
        self.volumeLabel.alpha = 0
        self.massSlider.alpha = 0
        self.volumeSlider.alpha = 0
        self.massSlider.value = 50
        self.massSlider.minimumValue = 1
        self.massSlider.maximumValue = 100
        self.volumeSlider.value = 50
        self.volumeSlider.minimumValue = 1
        self.volumeSlider.maximumValue = 100
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
    
    func updateDensityStatus() {
        let currentDensity = density.getDensityValue()
        if currentDensity > 1.25 {
            cubeImage.image = UIImage(named: "cube-high-density.png")
            densityLevelLabel.text = "Density Level: High"
        } else if currentDensity < 0.75 {
            cubeImage.image = UIImage(named: "cube-low-density.png")
            densityLevelLabel.text = "Density Level: Low"
        } else {
            cubeImage.image = UIImage(named: "cube-medium-density.png")
            densityLevelLabel.text = "Density Level: Medium"
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
            print(dict)
        }
        UIView.animate(withDuration: 1) {
            self.massLabel.alpha = 1
            self.volumeLabel.alpha = 1
            self.massSlider.alpha = 1
            self.volumeSlider.alpha = 1
        }
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
    }
}
