//
//  MainView.swift
//  Weather_35
//
//  Created by cmStudent on 2021/12/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var weatherData = Model()
    @ObservedObject var viewModel = MainViewModel()
    @State var weather = "天気予報"
    @State var image = ""
    var body: some View {
        ZStack {
            if let list = weatherData.weatherList {
                Image (viewModel.backImage(imageStr: list.icon))
                    .resizable()
            } else { }
            
            VStack {
                if let weather = weatherData.weatherList {
                    Text(weather.name)
                        .font(.system(size: 40))
                    Text("4°")
                        .font(.system(size: 70))

                    Text(weather.description)
                        .font(.system(size: 30))
                    
                } else { }
                Button {
                    weatherData.getWeather()
                    weather = ""
                } label: {
                    Text("\(weather)")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
