//
//  Weather.swift
//  Weather_35
//
//  Created by cmStudent on 2021/12/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let coord: Coord
    struct Coord: Decodable {
        let lon: Double
        let lat: Double
    }
    
    let weather: [Weather]
    struct Weather: Decodable, Hashable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}
struct URLConst {
    static let END_POINT = "https://api.openweathermap.org/data/2.5/weather"
    static let KEY = "Tokyo&app"
    static let ID = "21932ac8a106448a28ca03a29a7ec849"
    static let LANG = "ja"
}
