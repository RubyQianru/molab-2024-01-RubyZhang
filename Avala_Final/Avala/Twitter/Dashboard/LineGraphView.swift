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
    
    @State private var selectedTimestamp: Int?
    
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
            
            PointMark(
                x: .value("Date", Date(timeIntervalSince1970: Double(dataPoint.timestamp))),
                y: .value("Follower Count", dataPoint.followerCount)
            )
            .symbol(Circle())
            .foregroundStyle(selectedTimestamp == dataPoint.timestamp ? Color.greenColor : Color.blueColor)
//            .annotation(position: .top, alignment: .center) {
//                if selectedTimestamp == dataPoint.timestamp {
//                    Text("\(dataPoint.followerCount)")
//                        .font(.caption)
//                }
//            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day))
        }
        .chartYAxis(.hidden)
        .chartYScale(domain: mini - 500 ... maxi + 500)
        .foregroundStyle(Color.blueColor)

    }
}


struct FollowerDataPoint : Identifiable{
    let timestamp: Int
    let followerCount: Int
    var id: Int { timestamp }
    
}


