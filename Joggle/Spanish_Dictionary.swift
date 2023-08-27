//
//  Dictionary.swift
//  Joggle
//
//  Created by robin tetley on 21/08/2023.
//

import Foundation

enum Spanish_Dictionary {
    //will try and find the file in our bundle, try and load it, if that works, break it up into new lines and send it back
    private static let contents: Set<String> = {
//        guard let url = Bundle.main.url(forResource: "dictionary", withExtension: "txt") else {
//            fatalError("Cannot find dictionary.txt")
//        }
        
//        guard let url = Bundle.main.url(forResource: "es_ANY", withExtension: "dic") else {
//            fatalError("Cannot find dictionary.txt")
//        }
        guard let url = Bundle.main.url(forResource: "es", withExtension: "txt") else {
            fatalError("Cannot find dictionary.txt")
        }
        
        guard let contents = try? String(contentsOf: url) else {
            fatalError("Couldn't load dictionary.txt")
        }
        
        //now we have one big string for the entire contents of our dictionary, we send it back as a set for faster checking if there's a word in there on not.

//        let mySet = Set(contents.components(separatedBy: .newlines))
//        var myStrippedSet : Set<String> = []
//        for var str in mySet {
//            if let dotRange = str.range(of: "/") {
//              str.removeSubrange(dotRange.lowerBound..<str.endIndex)
//                myStrippedSet.insert(str)
//            } else {
//                myStrippedSet.insert(str)
//            }
//        }
        return Set(contents.components(separatedBy: .newlines))
    }()
    //he's made this private for a reason, it's an implementation detail. He doesn't want the rest of our code to worry about if it's a set or not.
    //makes checking if there's a word nice and easy
    static func contains(_ word: String) -> Bool {
        contents.contains(word)
    }
}
//It’s an enum because we don’t want people to try to create instances of it. The dictionary.txt file is loaded inside a static constant called contents. This is a Set for fast look up, but also marked private because we don’t want folks poking around in there. The contains() method does the actual job of looking up data, and it just passed the request straight to the contents set. The power of static let properties in Swift is that they are automatically singletons - the first time we access contents Swift will load the dictionary text, but it will then keep it in memory so that every subsequent access is immediate. Put another way, the first time we check if a word exists it'll load 'contents' and check and keep it in memory, the next time we check another word it'll just tell us straight away, no reloads necessary. 
