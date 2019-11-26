//
//  Film.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/24/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

struct Film {
    let title, openingCrawl: String
}

extension Film: Decodable {
    
    enum FilmCodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FilmCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        openingCrawl = try container.decode(String.self, forKey: .openingCrawl)
    }
    
}
