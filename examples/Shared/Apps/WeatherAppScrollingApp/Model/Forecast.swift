//
//  Forecast.swift
//  WeatherAppScrolling (iOS)
//
//  Created by Balaji on 16/06/21.
//

import SwiftUI

// Sample Model and ten days data....

struct WeatherAppScrollingDayForecast: Identifiable{
    var id = UUID().uuidString
    var day: String
    var farenheit: CGFloat
    var image: String
}

var weatherAppScrollingforecast = [

    WeatherAppScrollingDayForecast(day: "Today", farenheit: 94,image: "sun.min"),
    WeatherAppScrollingDayForecast(day: "Wed", farenheit: 90,image: "cloud.sun"),
    WeatherAppScrollingDayForecast(day: "Tue", farenheit: 98,image: "cloud.sun.bolt"),
    WeatherAppScrollingDayForecast(day: "Thu", farenheit: 99,image: "sun.max"),
    WeatherAppScrollingDayForecast(day: "Fri", farenheit: 92,image: "cloud.sun"),
    WeatherAppScrollingDayForecast(day: "Sat", farenheit: 89,image: "cloud.sun"),
    WeatherAppScrollingDayForecast(day: "Sun", farenheit: 96,image: "sun.max"),
    WeatherAppScrollingDayForecast(day: "Mon", farenheit: 94,image: "sun.max"),
    WeatherAppScrollingDayForecast(day: "Tue", farenheit: 93,image: "cloud.sun.bolt"),
    WeatherAppScrollingDayForecast(day: "Wed", farenheit: 94,image: "sun.min"),
]
