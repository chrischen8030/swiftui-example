//
//  WeatherForecastRequest.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import Foundation

struct WeatherForecastRequest: BaseRequest {
    typealias ResponseType = WeatherForecast
    
    var method: String {
        return "GET"
    }
    
    var path: String {
        return "/forecast"
    }
    
    var data:Data?{
        return nil
    }
}
