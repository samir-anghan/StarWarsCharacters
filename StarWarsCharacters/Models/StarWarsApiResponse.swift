//
//  StarWarsApiResponse.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/20/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

struct StarWarsApiResponse {
    let total: Int
    let nextPageURL: String?
    let previousPageURL: String?
    let persons: [Person]
}

extension StarWarsApiResponse: Decodable {
    
    private enum StarWarsApiResponseCodingKeys: String, CodingKey {
        case total = "count"
        case nextPageURL = "next"
        case previousPageURL = "previous"
        case persons = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StarWarsApiResponseCodingKeys.self)
        
        total = try container.decode(Int.self, forKey: .total)
        nextPageURL = try container.decodeIfPresent(String.self, forKey: .nextPageURL)
        previousPageURL = try container.decodeIfPresent(String.self, forKey: .previousPageURL)
        persons = try container.decode([Person].self, forKey: .persons)
    }
    
}
