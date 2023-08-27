//
//  Game.swift
//  Joggle
//
//  Created by robin tetley on 11/08/2023.
//
import Combine
import Foundation
 
class Game: ObservableObject {
    //keeps track of which player scored which words. Instead of stoppoing the players by telling them that the other player has found that word already (that would slow the game down a lot) we let them keep spelling but track who got them first.
    //the string is the word that was found, the Player is who found it first.
    var scores = [String: Player]()
    
     var spanishVersion = false
    
     var diceEitherOr: [[String]] {
        if spanishVersion {
            return [
                ["A", "R", "H", "S", "D", "E"],
                ["F", "U", "A", "A", "R", "B"],
                ["I", "O", "T", "A", "L", "G"],
                ["U", "O", "E", "E", "O", "Ch"],
                ["F", "O", "M", "T", "U", "I"],
                ["O", "O", "D", "B", "L", "G"],
                ["R", "P", "S", "Z", "L", "T"],
                ["E", "B", "I", "O", "U", "A"],
                ["C", "A", "R", "E", "M", "E"],
                ["R", "S", "J", "E", "F", "I"],
                ["N", "S", "X", "J", "A", "H"],
                ["U", "V", "D", "Q", "B", "Ch"],
                ["N", "B", "I", "M", "E", "E"],
                ["B", "A", "A", "N", "I", "T"],
                ["E", "P", "V", "O", "C", "U"],
                ["S", "C", "A", "A", "P", "T"]
            ]
        } else {
            return [
                    ["A", "A", "E", "E", "G", "N"],
                    ["A", "B", "B", "J", "O", "O"],
                    ["A", "C", "H", "O", "P", "S"],
                    ["A", "F", "F", "K", "P", "S"],
                    ["A", "O", "O", "T", "T", "W"],
                    ["C", "I", "M", "O", "T", "U"],
                    ["D", "E", "I", "L", "R", "X"],
                    ["D", "E", "L", "R", "V", "Y"],
                    ["D", "I", "S", "T", "T", "Y"],
                    ["E", "E", "G", "H", "N", "W"],
                    ["E", "E", "I", "N", "S", "U"],
                    ["E", "H", "R", "T", "V", "W"],
                    ["E", "I", "O", "S", "S", "T"],
                    ["E", "L", "R", "T", "T", "Y"],
                    ["H", "L", "N", "N", "R", "Z"],
                    ["H", "I", "M", "N", "U", "Qu"]
                ]
        }
    }
    //okay
//    var dice = [
//        ["A", "A", "E", "E", "G", "N"],
//        ["A", "B", "B", "J", "O", "O"],
//        ["A", "C", "H", "O", "P", "S"],
//        ["A", "F", "F", "K", "P", "S"],
//        ["A", "O", "O", "T", "T", "W"],
//        ["C", "I", "M", "O", "T", "U"],
//        ["D", "E", "I", "L", "R", "X"],
//        ["D", "E", "L", "R", "V", "Y"],
//        ["D", "I", "S", "T", "T", "Y"],
//        ["E", "E", "G", "H", "N", "W"],
//        ["E", "E", "I", "N", "S", "U"],
//        ["E", "H", "R", "T", "V", "W"],
//        ["E", "I", "O", "S", "S", "T"],
//        ["E", "L", "R", "T", "T", "Y"],
//        ["H", "L", "N", "N", "R", "Z"],
//        ["H", "I", "M", "N", "U", "Qu"]
//    ]...
    var dice = [
        ["A", "R", "H", "S", "D", "E"],
        ["F", "U", "A", "A", "R", "B"],
        ["I", "O", "T", "A", "L", "G"],
        ["U", "O", "E", "E", "O", "Ch"],
        ["F", "O", "M", "T", "U", "I"],
        ["O", "O", "D", "B", "L", "G"],
        ["R", "P", "S", "Z", "L", "T"],
        ["E", "B", "I", "O", "U", "A"],
        ["C", "A", "R", "E", "M", "E"],
        ["R", "S", "J", "E", "F", "I"],
        ["N", "S", "X", "J", "A", "H"],
        ["U", "V", "D", "Q", "B", "Ch"],
        ["N", "B", "I", "M", "E", "E"],
        ["B", "A", "A", "N", "I", "T"],
        ["E", "P", "V", "O", "C", "U"],
        ["S", "C", "A", "A", "P", "T"]
    ]
    
    var player1 = Player(color: .mint)
    var player2 = Player(color: .orange)
    var tiles = [String]()
    
    @Published var timeRemaining = 0.0
    @Published var showingResults = false
    private var timer: AnyCancellable?
    
    init() {
        reset()
    }
    
    func reset() {
        //picks one random letter from each array in dice thus resetting the tiles var.
        tiles = diceEitherOr.shuffled().map {
            $0.randomElement() ?? "X"
        }
        scores.removeAll()
        player1.reset()
        player2.reset()
        
        //tell our timer to fire every second, and set timeRemaining to 3 minutes
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: update)
        
        timeRemaining = 20
    }
    //subtract a second from our timer until finally we run out of time and show the results
    func update(_ newTime: Date) {
        // if this is called when we're showing results, do nothing
        guard showingResults == false else { return }
        
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            //the game is over
            showingResults = true
        }
    }
    
//track which player found a word first, which means inserting a word into the scores dictionary only if it isn’t there already
    func add(_ word: String, for player: Player) {
        if scores[word] == nil {
            scores[word] = player
        }
    }
    
//the above: we need to call it in one very precise place: inside the submit() method of our Player class, just next to where we use usedWords.append(word) to let each player track their own words.

    
}
