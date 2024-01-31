//: Creating random pattern from string

import SwiftUI
import PlaygroundSupport

// Protocol View: 
// A type that represents part of your app’s user interface
// and provides modifiers that you use to configure views.

struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

// Sets the view currently being displayed by Xcode on behalf of the playground page.
// Based on https://github.com/mobilelabclass-itp/02-Icon-Image

PlaygroundPage.current.setLiveView(
  MyView()
    .frame(width: 1024, height: 1024)
)
