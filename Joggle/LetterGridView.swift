//
//  LetterGridView.swift
//  Joggle
//
//  Created by robin tetley on 11/08/2023.
//
//Take a look and you'll see that instead of putting any of this in ContentView he's broken the grid out into it's own view (here) then the individual tile out into it's own file.

import SwiftUI

struct LetterGridView: View {
    //this gives us updating access to the selectedTiled @Published property amongst other things. 
    @ObservedObject var player: Player
    var game: Game
    
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    @State private var message: String? 
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: columns) {
                //spread the below data across the above amount of columns
                ForEach(0..<game.tiles.count, id: \.self) { index in
                    
                    //what letter is actually inside the index
                    let tile = game.tiles[index]
                    //Again that closure is the last selectTile function from LetterView.
                    LetterView(letter: tile, isSelected: player.selectedTiles.contains(index), selectionColor: player.color) {
                        //above, make this be the players selected color if it's in their selected tiles array.
                        //below is the call back from the trailing closure in LetterView (this triggers because LetterView is a button) but what we do when it triggers is call that trySelecting method in Player. _ is used because we don't currently care about the return value string.
                        //now we do care, by selecting we submit, by submitting we might get a message back, with a message it automatically shows.
                        message = player.trySelecting(index, in: game )
                    }
                }
            }
            .disabled(message != nil)
            if let message {
                VStack {
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.headline)
                    Button("Ok", action: dismissMessage)
                        .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(.black.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .transition(.scale)
            }
        }
        //make this think square at all times.
        .aspectRatio(1, contentMode: .fit)
    }
    
    func dismissMessage() {
        withAnimation {
            message = nil
        }
    }
}

struct LetterGridView_Previews: PreviewProvider {
    static var previews: some View {
        LetterGridView(player: Player(color: .orange), game: Game())
    }
}
