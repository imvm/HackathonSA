//
//  BathingQualityService.swift
//  HackathonSA
//
//  Created by Ian Manor on 04/08/18.
//  Copyright © 2018 Pregnant Places. All rights reserved.
//

import Foundation
import Moya
import CoreLocation

enum BathingQualityService {
    case getNearestBathingSpots(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
}

extension BathingQualityService: TargetType {
    var baseURL: URL { return URL(string: "https://ppss.vapor.cloud")! }
    var path: String {
        switch self {
        case .getNearestBathingSpots(_, _):
            return "/bathingspot"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNearestBathingSpots:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case let .getNearestBathingSpots(latitude, longitude):
            return .requestPlain
            //return .requestParameters(parameters: ["latitude": latitude, "longitude" : longitude], encoding: JSONEncoding.default)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getNearestBathingSpots(let latitude, let longitude):
            return "{\"latitude\": \"\(latitude)\", \"longitude\": \"\(longitude)\"}".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
