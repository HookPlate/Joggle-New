//
//  String-Scoring.swift
//  Joggle
//
//  Created by robin tetley on 21/08/2023.
//

import Foundation

extension String {
    var score: Int {
        //3 and 4 letter words are both worth one point
        if count < 5 {
            return 1
        } else {
            return count - 3
        }
    }
}
