//
//  myDic.swift
//  DictionaryTest
//
//  Created by robin tetley on 22/08/2023.
//

import Foundation

struct myDic {
    
 
    
    init(myArray: [String]) {
        var myArray = [String]()
        guard let url = Bundle.main.url(forResource: "es_ANY", withExtension: "dic") else {
            fatalError("Cannot find dictionary.txt")
        }
        
        guard let contents = try? String(contentsOf: url) else {
            fatalError("Couldn't load dictionary.txt")
        }
        
        let myTempArray = contents.components(separatedBy: .newlines)
        
        for var str in myTempArray {
            if let dotRange = str.range(of: "/") {
              str.removeSubrange(dotRange.lowerBound..<str.endIndex)
                myArray.append(str)
            } else {
                myArray.append(str)
            }

        }
        print(myArray)
    }
}
