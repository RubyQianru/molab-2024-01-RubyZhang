//
//  FollowerNumber.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/11.
//

import Foundation
import SwiftUI

struct FollowerNumberView : View {
    let number : Int
    var body: some View {
        if number >= 1000000 || number <= -1000000 {
            Text("\(String(format: "%.1f", Double(number)/1000000.0)) M")
        }  else if number  >= 1000 || number <= -1000 {
            Text("\(String(format: "%.1f", Double(number)/1000.0)) K")
        } else {
            Text("\(number)")
        }
    }
}




