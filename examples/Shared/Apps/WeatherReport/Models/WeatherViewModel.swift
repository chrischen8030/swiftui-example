//
//  WeatherViewModel.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import Foundation
import Combine
class WeatherViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published
    private(set) var address: String = "取得中"
    
    @Published
    private(set) var weathers:[Weather] = []
    
    
    func fetchWeatherForecast(){
        let request = WeatherForecastRequest()
        ApiClient.request(request)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished:
                    print("finished fetchWeatherForecast")
                }
            } receiveValue: { [weak self] weatherForecast in
                guard let self = self else {return}
                self.weathers = weatherForecast.weather
                self.address = weatherForecast.address
            }
            .store(in: &cancellables)

    }
}
