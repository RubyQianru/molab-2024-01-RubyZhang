//: Create an Xcode playground that makes an 1024x1024 image

import UIKit

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))

let image = renderer.image { (context) in
    
    UIColor.darkGray.setStroke()
    context.stroke(renderer.format.bounds)
    
    UIColor(red: 158/255, green: 215/255, blue: 245/255, alpha: 1).setFill()
    context.fill(CGRect(x: 1, y: 1, width: 140, height: 140))
    
    UIColor(red: 145/255, green: 211/255, blue: 205/255, alpha: 1).setFill()
    context.fill(CGRect(x: 60, y: 60, width: 140, height: 140), blendMode: .multiply)
}

image
