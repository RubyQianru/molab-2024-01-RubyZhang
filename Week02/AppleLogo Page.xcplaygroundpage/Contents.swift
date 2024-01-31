import SwiftUI
import PlaygroundSupport

struct ContentView: View {
  var body: some View {
    VStack(spacing: 0) {
//      Color.green
      Color.green
      Color.green
      Color.yellow
      Color.orange
      Color.red
      Color.purple
      Color.blue
    }
    .mask(
      Image(systemName: "applelogo")
        .resizable()
        .aspectRatio(contentMode: .fit)
    )
    .frame(width: 256, height: 256)
  }
}

PlaygroundPage.current.setLiveView(
  ContentView()
    .frame(width: 375, height: 812)
)

// https://github.com/mobilelabclass-itp/02-Icon-Image

// Source:
// https://recreatecode.com/
// https://gist.github.com/jordansinger/4d77f1b44223417ec2243c430da089af
// AppleLogo.swift

