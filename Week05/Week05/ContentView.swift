//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("SeaSell")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Group {
                    Button(action: {}) {
                        Image(systemName: "bell.badge")
                    }
                }
                .font(Font.body.weight(.bold))
                .foregroundColor(Color("purple"))
            }
            Text("Find Your NFTs Today")
            
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(1...4, id: \.self) { index in
                        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
                            Image("\(index)")
                                .resizable()
                                .scaledToFill()
                                .frame(width:250)
                            
                            HStack (spacing: 20){
                                Group {
                                    Button(action: {}) {
                                        HStack {
                                            Spacer()
                                            Text("Start")
                                                .padding(.vertical, 10)
                                            Spacer()
                                        }
                                    }
                                    .foregroundColor(Color("black"))
                                    .background(Color("green"))
                                    .clipShape(Capsule())
                                    
                                    Button(action: {}) {
                                        ZStack {
                                            Circle()
                                                .frame(width: 35, height: 35, alignment: .center)
                                                .foregroundColor(.white)
                                            Image(systemName: "heart")
                                                .font(Font.system(size: 20))
                                                .foregroundColor(Color("purple"))
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }.padding(.horizontal)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top, 20)
            .frame(height: 300)
            Spacer(minLength: 0)
        }
        .padding()
        .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
