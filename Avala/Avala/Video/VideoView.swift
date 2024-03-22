//
//  VideoView.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

import SwiftUI

struct VideoView: View {
    @State var analysis: String = ""
    
    var body: some View {
        VStack {
            Text(analysis).frame(height: 40)
            BridgeView(analysis: $analysis)
        }
    }
}

struct BridgeView: UIViewControllerRepresentable {
    @Binding var analysis: String

    func makeUIViewController(context: Context) -> some UIViewController {
        print("BridgeView makeUIViewController")
        
        let storyBoard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
        let viewCtl = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController;
        
        print("BridgeView viewCtl", viewCtl)

        viewCtl.reportChange = {
            // print("reportChange")
            analysis = viewCtl.analysis
        }
        return viewCtl
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // print("BridgeView updateUIViewController")
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
