//
//  EndPointType.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/20/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
