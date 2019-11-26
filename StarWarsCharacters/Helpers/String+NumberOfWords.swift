//
//  String+NumberOfWords.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/26/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

extension String {
    func numberOfWords() -> Int {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = self.components(separatedBy: chararacterSet)
        let words = components.filter { !$0.isEmpty }
        return words.count
    }
}
