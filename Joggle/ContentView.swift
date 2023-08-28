//
//  ContentView.swift
//  Joggle
//
//  Created by robin tetley on 11/08/2023.
//. let's see if I'm back hooked up to github

import SwiftUI

struct ContentView: View {
    //
    
    
    var body: some View {
            
            NavigationStack {
                ZStack {
                    Image("Joggle_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        VStack(spacing: 60) {
                            VStack {
                                Text("Jugar en Español")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                NavigationLink(destination: GameView(isSpanish: true)) {
                                    Image("spain")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .frame(maxWidth: 150)
                                }
                            }
                            .padding()
                            .background(.black.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                          //  Spacer()
                            
                            VStack {
                                Text("Play in English")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                NavigationLink(destination: GameView(isSpanish: false)) {
                                    Image("uk")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .frame(maxWidth: 150)
                                }
                            }
                            .padding()
                            .background(.black.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            Spacer()
                                .frame(height: 1)
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
