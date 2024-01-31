//: Create an Xcode playground that makes an 1024x1024 image

// https://developer.apple.com/documentation/uikit/uigraphicsimagerenderer

import UIKit

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))

let image = renderer.image { (context) in
    
    UIColor.darkGray.setStroke()
    context.stroke(renderer.format.bounds)
    
    //yellow body
    UIColor(red: 253/255, green: 218/255, blue: 13/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 0, width: 300, height: 160))
    
    //brown stripes
    UIColor(red: 110/255, green: 38/255, blue: 14/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 0, width: 30, height: 160))
    
    UIColor(red: 110/255, green: 38/255, blue: 14/255, alpha: 1).setFill()
    context.fill(CGRect(x: 50, y: 0, width: 30, height: 160))
    
    UIColor(red: 110/255, green: 38/255, blue: 14/255, alpha: 1).setFill()
    context.fill(CGRect(x: 100, y: 0, width: 30, height: 160))
    
    //black eyes
    UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).setFill()
    context.fill(CGRect(x: 140, y: 60, width: 50, height: 80))
    
    UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).setFill()
    context.fill(CGRect(x: 250, y: 60, width: 50, height: 80))
    
    //blue pupils
    UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1).setFill()
    context.fill(CGRect(x: 165, y: 60, width: 25, height: 25))
    
    UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1).setFill()
    context.fill(CGRect(x: 275, y: 60, width: 25, height: 25))
    
    //brown legs
}

image
