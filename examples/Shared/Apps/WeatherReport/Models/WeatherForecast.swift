//
//  WeatherForecast.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import Foundation

///天気予報
struct WeatherForecast: Codable {
    //住所
    let address:String
    let weather: [Weather]
}

// 天気情報

struct Weather: Codable {
    let time: Int
    let weatherType: WeatherType
    let rainyPercent: Int
}

//天気種別

enum WeatherType: Int, Codable {
    case sunny = 0
    case cloudy = 1
    case rain = 2
    
    func toString() -> String {
        switch self {
        case .sunny: return "晴れ"
        case .cloudy: return "曇り"
        case .rain: return "雨"
        }
    }
}
