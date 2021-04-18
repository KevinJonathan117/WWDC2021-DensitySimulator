//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
/*:
 [Previous: Density](@previous)
# Relative Density
 
## How About Relative Density?
 Relative density is a __ratio__ of the densities of two materials. Also known as specific gravity, even though it is similar but not the same (In specific gravity, the reference material is __water__ or __H₂O__).
 
 If a substance's relative density is less than one then it is less dense than the reference. If greater than 1 then it is denser than the reference. If the relative density is exactly 1 then the densities are equal, that is, equal volumes of the two substances hae the same mass. If the reference material is water then a substance with a relative density (or specific gravity) less than 1 will float in water. For example, an ice cube, with a relative density of about 0.91, will float. A substance with a relative density greater than 1 will sink.
 
 ## Unit Measurement & Formula of Relative Density
 __Relative density doesn't have a unit__, hence we can just state the value after dividing the density of substance with the density of reference. The formula of Relative density is RD = (ρ Substance ÷ ρ Reference), where RD stands for Relative Density.
 
 Now let's use the simulator! You can change the code below (and customizing it) then try to run it!
*/
var substanceDensity : Int = /*#-editable-code*/10/*#-end-editable-code*/
var substanceColor : UIColor = /*#-editable-code*/ #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) /*#-end-editable-code*/
var referenceDensity : Int = /*#-editable-code*/10/*#-end-editable-code*/
/*:
# End of the Journey 😥
 We have reached the end of the journey. That was fast, was't it?
 As I told you in the previous page of the playground, __we can't just memorize every formula without knowing the concept__.
 I hope that this playground can give you an insight on how to learn physics in a fun and interactive way. I mean, every
 learning method can also determine how can we learn effectively in subjects at school, right? I hope you liked my method
 on learning how density works (and the music of course!). See you again! 👋
*/
//#-hidden-code
let substanceRedColor = Double((substanceColor.cgColor.components?[0])!)
let substanceGreenColor = Double((substanceColor.cgColor.components?[1])!)
let substanceBlueColor = Double((substanceColor.cgColor.components?[2])!)
proxy.send(PlaygroundValue.dictionary([
  "substanceDensity": PlaygroundValue.integer(substanceDensity),
  "referenceDensity": PlaygroundValue.integer(referenceDensity),
    "substanceRedColor": PlaygroundValue.floatingPoint(substanceRedColor),
    "substanceGreenColor": PlaygroundValue.floatingPoint(substanceGreenColor),
    "substanceBlueColor": PlaygroundValue.floatingPoint(substanceBlueColor)
]))
//#-end-hidden-code
