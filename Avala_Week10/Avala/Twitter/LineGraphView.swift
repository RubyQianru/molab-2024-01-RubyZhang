//
//  LineGraphView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/11.
//

import Foundation
import SwiftUI
import Charts

struct LineGraphView: View {
    let counts: [Int: Int]
    let maxi: Int
    let mini: Int
    
    var dataPoints: [FollowerDataPoint] {
        counts.map { FollowerDataPoint(timestamp: $0.key, followerCount: $0.value) }
            .sorted { $0.timestamp < $1.timestamp }
    }
    
    
    var body: some View {
        
        Chart(dataPoints, id: \.timestamp) { dataPoint in
            LineMark(
                x: .value("Date", Date(timeIntervalSince1970: Double(dataPoint.timestamp))),
                y: .value("Follower Count", dataPoint.followerCount)
            )
            .interpolationMethod(.catmullRom)
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day))
        }
        .chartYScale(domain: mini - 500 ... maxi + 500)
        
    }
}


struct FollowerDataPoint {
    let timestamp: Int
    let followerCount: Int
}


