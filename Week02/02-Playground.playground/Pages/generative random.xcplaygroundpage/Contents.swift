//: Create an Xcode playground that makes an 1024x1024 image

import SwiftUI
import PlaygroundSupport

// Protocol View: 
// A type that represents part of your app’s user interface
// and provides modifiers that you use to configure views.

struct MyView: View {
    var body: some View {
        VStack {
            Image(systemName:  "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello!")
        }
        .padding()
    }
}

// Sets the view currently being displayed by Xcode on behalf of the playground page.
// Based on https://github.com/mobilelabclass-itp/02-Icon-Image

#Preview {
    MyView()
}
