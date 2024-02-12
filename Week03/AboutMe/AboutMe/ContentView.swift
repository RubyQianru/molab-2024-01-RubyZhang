/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(1...100, id: \.self) { _ in
                Circle()
                    .foregroundColor(.randomColor())
                    .frame(width: CGFloat.random(in: 20...50), height: CGFloat.random(in: 20...100))
                    .position(x: CGFloat.random(in: 0...375), y: CGFloat.random(in: 0...10))
                    }
                }
    }
}

//chat-gpt: random color with random opacity
extension Color {
    static func randomColor() -> Color {
        return Color(red: Double.random(in: 0...0.8),
                     green: 0,
                     blue: Double.random(in: 0...0.8),
                     opacity: .random(in: 0...1)
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

