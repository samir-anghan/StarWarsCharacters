//
//  String+UrlLastPathComponent.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

extension String {
    func lastPathComponent() -> String? {
        if let urlFromString = URL(string: self) {
             return urlFromString.pathComponents.last
        } else {
            return nil
        }
    }
}
