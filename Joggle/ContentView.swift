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
            VStack(spacing: 30) {
                //both need refactoring out
                VStack {
                    Text("Juega en Español")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.headline)
                    NavigationLink(destination: GameView()) {
                        Image("spain")
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .background(.black.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
              //  Spacer()
                
                VStack {
                    Text("Play in English")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.headline)
                    NavigationLink(destination: GameView()) {
                        Image("uk")
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .background(.black.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
