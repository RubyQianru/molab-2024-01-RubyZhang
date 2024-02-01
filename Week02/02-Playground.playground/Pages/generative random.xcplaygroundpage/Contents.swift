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
    let peach = UIColor(red: 255/255, green: 229/255, blue: 180/255, alpha: 1)
    let brown = UIColor(red: 110/255, green: 38/255, blue: 14/255, alpha: 1)
    let black = UIColor.black
    let blue = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
    
    UIColor.darkGray.setStroke()
    context.stroke(renderer.format.bounds)
    
    //background
    peach.setFill()
    context.fill(CGRect(x:0, y:0, width: 1024, height: 1024))
    
    //white wings
    UIColor.white.setStroke()
    
    for i in 0...1 {
        let wingPath = UIBezierPath(rect: CGRect(x: 512+80+120*i-150, y: 512-30-80, width: 75, height: 50))
        wingPath.lineWidth = 10.0
        wingPath.stroke()
    }
    
    //yellow body
    yellow.setFill()
    context.fill(CGRect(x: 512-150, y: 512-80, width: 300, height: 160))
    
    //brown stripes
    brown.setFill()
    for i in 0..<3 {
        context.fill(CGRect(x: i * 50 + 512-150, y: 512-80, width: 30, height: 160))
    }
    
    //black eyes
    black.setFill()
    
    for i in [140, 250] {
        context.fill(CGRect(x: i + 512-150, y: 60 + 512-80, width: 50, height: 80))
    }
    
    
    //blue pupils
    blue.setFill()
    
    for i in [165, 275] {
        context.fill(CGRect(x: i + 512-150, y: 60 + 512-80, width: 25, height: 25))
    }

    //black legs
    black.setFill()
    
    for i in [145, 255] {
        context.fill(CGRect(x: i + 512-150, y: 160 + 512-80, width: 25, height: 40))
    }
    
    //black brows
    black.setFill()
    
    for i in [145, 255] {
        context.fill(CGRect(x: i + 512-150, y: 20 + 512-80, width: 45, height: 20))
    }
    
    //black pin
    black.setFill()
    
    context.fill(CGRect(x: 512-30-150, y: 512, width: 30, height: 15))
    
}

image

//Following code modified from 10print save folderr
let data = image.pngData()

let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let filePath = folder!.appendingPathComponent("beebee.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath)")
print("cp \(filePath.absoluteString.dropFirst(7)) ~/Downloads/beebee.png" )
