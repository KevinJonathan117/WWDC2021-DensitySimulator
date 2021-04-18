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
# WWDC 2021: Density Simulator
 
## My Motivation 🔥
As a student tutor that teaches math and science, I have already seen many students having a hard time in understanding physics, including, but not limited to how density works. I hope this playground can help students to learn about density in a fun and interactive way.
 
## Who Am I? 🤔
I am a student currently enrolled in Computer Science major from 🇮🇩 and also a student tutor in a course. I am interested in learning anything related to science and iOS development. By the way, this is my first time creating a playground!
 
## Overview ☀️
In this playground, we will examine the relationship between substance's __mass__, __volume__ and its __density__ using the simulator provided. We will also examine what happens if we put a __substance__ to a __reference__ (with its own density).
 
 ## Wait, what was Density again?
 To put it simply, __density__ is a measure of __mass__ per __volume__ (ρ = mass ÷ volume). Try changing the value in the code below and run the code!
 */
var mass: Int = /*#-editable-code*/10/*#-end-editable-code*/
var volume: Int = /*#-editable-code*/5/*#-end-editable-code*/
/*:
 Once you are done, click next to continue!
 Don't worry if you didn't get it. We will be using the simulator in the next page to help you understand!
 
 [Next: Density](@next)
*/

//#-hidden-code
proxy.send(PlaygroundValue.dictionary([
  "mass": PlaygroundValue.integer(mass),
  "volume": PlaygroundValue.integer(volume)
]))
//#-end-hidden-code
