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
 [Previous: Introduction](@previous)
# Density
 
## Density in a Nutshell
In the previous page, I said that __density__ is simply a measure of __mass__ per __volume__ (or the degree of compactness of a substance). But why? We can't just memorize
every formula in physics subject without knowing the concepts, right?

Imagine you have 2 boxes with different materials but same size: Foam and Wood. If you lift every of the boxes, you will feel that the box with wood material is heavier. Well, because the box with wood material has higher density than the box with foam material. As simple as that! This is why an object made from a comparatively dense material (such as iron) will have less volume than an object of equal mass made from some less dense substance (such as water).
 
## Other uses of the term
 "Density" sometimes means the ratio between other properties instead of mass and volume. Then it means how much of a property can be found in a specific piece of what they are looking at. For example, population density is how many people live within the same amount of land area. But in this playground we will be focusing on mass and volume properties first!

You can try the simulator that is provided on the right on the screen. __Try running the code and changing the sliders' thumb position to see what happen!__

Once you are done, click next to continue!
 
 [Next: Relative Density](@next)
*/

//#-hidden-code
proxy.send(PlaygroundValue.dictionary([
  "mass": PlaygroundValue.integer(50),
  "volume": PlaygroundValue.integer(50)
]))
//#-end-hidden-code
