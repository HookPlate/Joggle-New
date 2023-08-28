//
//  ContentView.swift
//  Joggle
//
//  Created by robin tetley on 11/08/2023.
//. let's see if I'm back hooked up to github

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var game: Game
    
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
                                NavigationLink(destination: GameView().onAppear{game.spanishVersion = true}) {
                                    Image("spain")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .frame(maxWidth: 150)
                                }
//                                .onTapGesture {
//                                    game.gameIsInSpanishVersion(spanishVersion: true)
//                                    //game.spanishVersion.toggle()
//                                }
                            }
                            .padding()
                            .background(.black.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            VStack {
                                Text("Play in English")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                NavigationLink(destination: GameView().onAppear{game.spanishVersion = false}) {
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
//                            .onTapGesture {
//                               // game.spanishVersion.toggle()
//                                game.gameIsInSpanishVersion(spanishVersion: false)
//                            }
                            
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
