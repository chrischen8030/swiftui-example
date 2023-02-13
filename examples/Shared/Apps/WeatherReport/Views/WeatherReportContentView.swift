//
//  WeatherReportContentView.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import SwiftUI

struct WeatherReportContentView: View {
    @ObservedObject var viewModel: WeatherViewModel
       
       init(viewModel: WeatherViewModel) {
           self.viewModel = viewModel
       }
       
       var body: some View {
           VStack {
               Button {
                   viewModel.fetchWeatherForecast()
               } label: {
                   Text("取得")
                       .frame(width: 60, height: 32)
                       .foregroundColor(.white)
                       .background(Color.blue)
                       .cornerRadius(10)
               }
               .padding()
               Text("\(viewModel.address)")
               Spacer()
               List {
                   ForEach(0..<viewModel.weathers.count, id: \.self) {
                       WeatherRow(weather: viewModel.weathers[$0])
                   }
               }
           }
       }
}

struct WeatherRow: View {
    var weather: Weather
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(weather.time)時")
                .font(.title)
            Text("天気: " + weather.weatherType.toString())
            Text("降水確率: \(weather.rainyPercent)%")
        }
        .padding()
    }
}

struct WeatherReportContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportContentView(viewModel:WeatherViewModel())
    }
}
