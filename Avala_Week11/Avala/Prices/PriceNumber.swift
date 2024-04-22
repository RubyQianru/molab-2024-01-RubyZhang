//
//  PriceNumber.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/22.
//


import Foundation
import SwiftUI

struct PriceView: View {
    let number: Double

    var formattedNumber: String {
        let formatted: String
        if number >= 1000000000.0 {
            formatted = String(format: "%.1fB", number/1000000000.0)
        } else if number >= 1000000.0  {
            formatted = String(format: "%.1fM", number/1000000.0)
        } else if number >= 1000.0  {
            formatted = String(format: "%.1fK", number/1000.0)
        } else if number >= 0.001 {
            return String(format: "%.3f", number)
        } else {
            return String(format: "%.0e", number)
        }
        return formatted
    }
    
    var body: some View {
        Text("$"+formattedNumber)
            .frame(width: 65, height: 10, alignment: .center) 
    }
}
