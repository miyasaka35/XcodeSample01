//
//  Model.swift
//  Weather_35
//
//  Created by cmStudent on 2022/01/04.
//

import Foundation

class Model: ObservableObject {
    struct WeatherItem: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let temp: Double
        let icon: String
    }
    
    struct weatherResult: Codable {
        struct Weather: Codable {
            let id: Int?
            let main: String?
            let description: String?
            let name: String?
            let icon: String
        }
        struct Main: Codable {
            let temp: Double
        }
        
        let weather: [Weather]?
        let name: String
        let main: Main
    }
    
    @Published var weatherList: WeatherItem!
    
    func getWeather() {
        guard let req_url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=21932ac8a106448a28ca03a29a7ec849&lang=ja&units=metric")
        else {
            return
        }
//        print(req_url)
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        //print(req)
        let task = session.dataTask(with: req, completionHandler: {
            (data, response, error) in
            session.finishTasksAndInvalidate()
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(weatherResult.self, from: data!)
                //print(json)
                
                if let items = json.weather {
                    self.weatherList = WeatherItem(name: json.name, description: items.first!.description!, temp: json.main.temp, icon: items.first!.icon)
                    
//                    self.weatherList.removeAll()
                    
//                    for item in items {
//                        if let id = item.id,
//                           let name = item.name,
//                           let description = item.description,
//                           let temp = item.temp,
//                    }
                    
//                    let tenki = WeatherItem(id: id, name: name, description: description, temp: temp)
//                     self.weatherList.append(tenki)
                    
//                    print(self.weatherList)
                }
            } catch  {
                print(error)
            }
        })
        task.resume()
        
        
        
    }
}
