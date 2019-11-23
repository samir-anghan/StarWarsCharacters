//
//  StarWarsAPI.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/20/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

public enum StarWarsAPI {
    case allpersons(page: Int)
}

extension StarWarsAPI: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://swapi.co/api/"
        case .qa: return "https://swapi.co/api/"
        case .staging: return "https://swapi.co/api/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .allpersons:
            return "people/"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .allpersons(let page):
            return ["page": page]
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .allpersons:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters)
        }
        
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
