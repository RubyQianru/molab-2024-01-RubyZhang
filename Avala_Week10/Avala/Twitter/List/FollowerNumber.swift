//
//  FollowerNumber.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/11.
//

import Foundation
import SwiftUI

struct FollowerNumberView : View {
    let number: Int

    var formattedNumber: String {
        if number >= 1000000 || number <= -1000000 {
            return String(format: "%.1fM", Double(number)/1000000.0)
        } else if number >= 1000 || number <= -1000 {
            return String(format: "%.1fK", Double(number)/1000.0)
        } else {
            return "\(number)"
        }
    }
    
    var body: some View {
        Text(formattedNumber)
    }
}




