//
//  PlayerResults.swift
//  Joggle
//
//  Created by robin tetley on 21/08/2023.
//

import SwiftUI

struct PlayerResults: View {
    
    var number: Int
    var score: Int
    //all the words they found first
    var words: [String]
    
    
    
    var body: some View {
        Section {
            if words.isEmpty {
                //Text("None")
                Text("Ninguno")
            } else {
                //since in boggle you can't have duplicate words using self for id is fine here.
                ForEach(words, id: \.self) { word in
                    Text("\(word) (\(word.score))")
                }
            }
        } header: {
//            Text("Player \(number) score")
            Text("Jugador \(number) resultado")
        } footer: {
            //he special “inflect” Markdown syntax tells SwiftUI we want the string to say “0 points”, “1 point”, “2 points”, etc – it pluralizes the string correctly for us.
            //Text("Total: ^[\(score) points](inflect: true)")
            Text("Total: ^[\(score) puntos](inflect: true)")
        }
    }
}

struct PlayerResults_Previews: PreviewProvider {
    static var previews: some View {
        PlayerResults(number: 1, score: 4, words: ["the", "cat", "sat", "mat"])
    }
}
