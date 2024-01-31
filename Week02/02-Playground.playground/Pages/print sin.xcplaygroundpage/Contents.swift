/*:
 # Welcome to Playgrounds
 This is your *first* playground which is intended to demonstrate:
 * The use of **Quick Look**
 * Placing results **in-line** with the code
 */

import UIKit

for x in 0...20*2 {
    let xd = 2 * Double.pi * (Double(x) / 20.0)
    let y = sin( xd )
    // print("y \(y) x \(x) ")
    let ny = 10.0 + (10.0 * y)
    let str = String(repeating: " ", count: Int(ny))
    //  var str = ""
    //  for i in 0...Int(ny) {
    //    str += " "
    //  }
    print( str + "*")
}

//: [Next](@next)

