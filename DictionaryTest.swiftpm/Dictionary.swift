//
//  Dictionary.swift
//  DictionaryTest
//
//  Created by robin tetley on 22/08/2023.
//

import Foundation


enum Dictionary {
    //will try and find the file in our bundle, try and load it, if that works, break it up into new lines and send it back
    static let contents: Set<String> = {
//        guard let url = Bundle.main.url(forResource: "dictionary", withExtension: "txt") else {
//            fatalError("Cannot find dictionary.txt")
//        }
        
        guard let url = Bundle.main.url(forResource: "es_ANY", withExtension: "dic") else {
            fatalError("Cannot find dictionary.txt")
        }
        
        guard let contents = try? String(contentsOf: url) else {
            fatalError("Couldn't load dictionary.txt")
        }
        
        //now we have one big string for the entire contents of our dictionary, we send it back as a set for faster checking if there's a word in there on not.
        return Set(contents.components(separatedBy: .newlines))
    }()
    //he's made this private for a reason, it's an implementation detail. He doesn't want the rest of our code to worry about if it's a set or not.
    //makes checking if there's a word nice and easy
    static func contains(_ word: String) -> Bool {
        contents.contains(word)
    }
}
