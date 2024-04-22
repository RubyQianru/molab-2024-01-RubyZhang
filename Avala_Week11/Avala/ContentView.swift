//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//


import SwiftUI
import CoinbaseWalletSDK


struct ContentView: View {
    var body: some View {
        VStack() {
            HeaderView(title: "Avala")
            
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(1...4, id: \.self) { index in
                        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
                            Image("\(index)")
                                .resizable()
                                .scaledToFill()
                                .frame(width:200, height: 150)
                            
                            
                            HStack (spacing: 20){
                                Group {
//                                    Button(action: {}) {
//                                        HStack {
//                                            Spacer()
//                                            Text("Start")
//                                                .padding(.vertical, 10)
//                                            Spacer()
//                                        }
//                                    }
//                                    .background(Color.greenColor)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    Spacer()
                                    Button(action: {}) {
                                        ZStack {
                                            Circle()
                                                .frame(width: 35, height: 35, alignment: .center)
                                                .foregroundColor(.white)
                                            Image(systemName: "heart")
                                                .font(Font.system(size: 20))
                                                .foregroundColor(Color(.pink))
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }.padding(.horizontal)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 10)
                    }
                }
            }
            .padding()
            .frame(height: 180)
            ConnectView()
                .onOpenURL(perform: { url in
                    print("Reveived ULR \(url.absoluteString)")
                    _ = try? CoinbaseWalletSDK.shared.handleResponse(url)
                })
            Spacer(minLength: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
