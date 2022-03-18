//
//  MainViewModel.swift
//  Weather_35
//
//  Created by cmStudent on 2022/01/04.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    func backImage(imageStr: String) -> String {
        switch imageStr  {
            
        case "01d":
            return "clear"
        case "01n":
            return "clear"
        case "02d":
            return "clear"
        case "02n":
            return "clear"
            
        case "03d":
            return "cloud"
        case "03n":
            return "cloud"
        case "04d":
            return "cloud"
        case "04n":
            return "cloud"
            
        case "09d":
            return "rain"
        case "09n":
            return "rain"
        case "10d":
            return "rain"
        case "10n":
            return "rain"
            
        case "11d":
            return "thunderstorm"
        case "11n":
            return "thunderstorm"
            
        case "13d":
            return "snow"
        case "13n":
            return "snow"
            
        case "50d":
            return "mist"
        case "50n":
            return "snow"
            
        default:
            return ""
        }

    }
}
