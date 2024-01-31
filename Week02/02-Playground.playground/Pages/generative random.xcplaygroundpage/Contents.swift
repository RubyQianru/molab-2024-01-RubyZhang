//: Create an Xcode playground that makes an 1024x1024 image

// https://developer.apple.com/documentation/uikit/uigraphicsimagerenderer

import UIKit

let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))

let image = renderer.image { (context) in
    
    //
    // Define colors
    // Codes belowed simplified by ChatGPT (how to make this code more simplified?)
    // simplified from my original code
    
    let darkGray = UIColor.darkGray
    let yellow = UIColor(red: 253/255, green: 218/255, blue: 13/255, alpha: 1)
    let brown = UIColor(red: 110/255, green: 38/255, blue: 14/255, alpha: 1)
    let black = UIColor.black
    let blue = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
    
    UIColor.darkGray.setStroke()
    context.stroke(renderer.format.bounds)
    
    //yellow body
    yellow.setFill()
    context.fill(CGRect(x: 0, y: 0, width: 300, height: 160))
    
    //brown stripes
    brown.setFill()
    for i in 0..<3 {
        context.fill(CGRect(x: i * 50, y: 0, width: 30, height: 160))
    }
    
    //black eyes
    black.setFill()
    
    for i in [140, 250] {
        context.fill(CGRect(x: i, y: 60, width: 50, height: 80))
    }
    
    
    //blue pupils
    blue.setFill()
    
    for i in [165, 275] {
        context.fill(CGRect(x: i, y: 60, width: 25, height: 25))
    }

    //brown legs
    brown.setFill()
}

image
