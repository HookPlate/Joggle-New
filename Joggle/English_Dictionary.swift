//
//  English_Dictionary.swift
//  Joggle
//
//  Created by robin tetley on 27/08/2023.
//

import Foundation

enum English_Dictionary {

    private static let contents: Set<String> = {
        guard let url = Bundle.main.url(forResource: "dictionary", withExtension: "txt") else {
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
