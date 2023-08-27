//
//  Player.swift
//  Joggle
//
//  Created by robin tetley on 11/08/2023.
//

import SwiftUI

class Player: ObservableObject {
    var usedWords = [String]()
    var color = Color.black
    
    var spanishVersion = false
    //positions of the letters on the board they've tapped so far. In this way we can check its adjacent neighbours and deselect them later on..
    @Published var selectedTiles = [Int]()
    
    init(color: Color) {
        self.color = color
    }
    //resets that players game
    func reset() {
        selectedTiles.removeAll()
        usedWords.removeAll()
    }
    
    func trySelecting(_ index: Int, in game: Game) -> String? {
        //If the user is tapping the last tile they selected, and they have at least two other tiles already selected:
        if selectedTiles.last == index && selectedTiles.count >= 3 {
             return submit(in: game)
        }
        
        if let indexLocation = selectedTiles.firstIndex(of: index) {
            //deselect tiles:
            if selectedTiles.count == 1 {
                //if it's their only letter then just remove it on a second tap.
                selectedTiles.removeLast()
            } else {
                //Otherwise, if this tile was already selected we’ll deselect all later tiles so the user can change their mind
                selectedTiles.removeLast(selectedTiles.count - indexLocation - 1)
            }
        } else {
            tryAppending(index)
        }
        //if we're here it means there's no error to report, just send back nil.
        return nil
    }
    
    func tryAppending(_ newIndex: Int) {
        //this might append it and it might not if it's too far away.
        guard let lastIndex = selectedTiles.last else {
            selectedTiles.append(newIndex)
            return
        }
        //don't unserstand the math here. I get what it's doing but why?
        let lastPosition = (row: lastIndex / 4, col: lastIndex % 4)
        let newPosition = (row: newIndex / 4, col: newIndex % 4)
        //abs disegards whether it's positive or negative, it just gives us positive at all times.
        let positionDifference = (row: abs(newPosition.row - lastPosition.row), col: abs(newPosition.col - lastPosition.col))
        
        if max(positionDifference.row, positionDifference.col) == 1 {
            selectedTiles.append(newIndex)
        }
    }
    
    func submit(in game: Game) -> String? {
        //Form a single word by joining all the player’s tiles into a single string.
        let word = selectedTiles.map { game.tiles[$0] }.joined().lowercased()
        //Checking they haven’t used that word before.
        guard usedWords.contains(word) == false else  {
          //  return "You used that word already"
            return "Ya usaste esa palabra"
        }
        //Checking that the dictionary actually contains that word.
        if spanishVersion {
            if Spanish_Dictionary.contains(word) {
                //If both of those are true, we’ll add the word to the player’s usedWords array, then clear their selectedTiles array so they can start spelling a new word.
                usedWords.append(word)
                //Again, yes: this means we’re tracking used words in two places. However, the context is slightly different: we track individual player’s words so we can tell them when they have used a word more than once, but it would be annoying to do that for words the opponent found because it would slow down the game too much.

                game.add(word, for: self)
                selectedTiles.removeAll()
            } else {
                return "Esta palabra no la conozco"
            }
        } else {
            if English_Dictionary.contains(word) {

                usedWords.append(word)


                game.add(word, for: self)
                selectedTiles.removeAll()
            } else {
                return "Esta palabra no la conozco"
            }
        }
        
        return nil
    }
}
