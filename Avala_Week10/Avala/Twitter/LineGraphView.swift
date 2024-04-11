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
    
    var dataPoints: [FollowerDataPoint] {
        counts.map { FollowerDataPoint(timestamp: $0.key, followerCount: $0.value) }
            .sorted { $0.timestamp < $1.timestamp }
    }
    
    var minPoint: Int {
        dataPoints.first?.followerCount ?? 0
    }
    
    var maxPoint: Int {
        dataPoints.last?.followerCount ?? 0
    }
    
    
    var body: some View {
        let dynamicPadding = max(2000, (maxPoint - minPoint) * Int(0.1)) // 10% of the range or 2000, whichever is greater
        let adjustedMinPoint = max(0, minPoint - dynamicPadding)
        let adjustedMaxPoint = maxPoint + dynamicPadding
        
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
        .chartYScale(domain: adjustedMaxPoint  - 5000 ... adjustedMaxPoint)
    }
}


struct FollowerDataPoint {
    let timestamp: Int
    let followerCount: Int
}


