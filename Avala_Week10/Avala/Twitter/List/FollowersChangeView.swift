import Foundation
import SwiftUI

struct FollowerChangeView: View {
    let diff: Int

    var body: some View {
        Group {
            if diff > 0 {
                positiveChange
            } else if diff < 0 {
                negativeChange
            } else {
                neutralChange
            }
        }
        .frame(width: 100)
    }

    private var positiveChange: some View {
        HStack {
            Spacer()
            Image(systemName: "arrowtriangle.up.fill")
                .foregroundColor(.green)
                .frame(width: 10, height: 10)
            FollowerNumberView(number: diff)
                .foregroundColor(.green)
        }
    }

    private var negativeChange: some View {
        HStack {
            Spacer()
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(.red)
                .frame(width: 10, height: 10)
            FollowerNumberView(number: diff)
                .foregroundColor(.red)
        }
    }

    private var neutralChange: some View {
        HStack {
            Spacer()
            Image(systemName: "equal")
                .frame(width: 10, height: 10)
            FollowerNumberView(number: diff)
        }
    }
}

