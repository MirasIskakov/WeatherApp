//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Miras Iskakov on 15.04.2024.
//

import Foundation
import UIKit

struct WeatherData {
    let name: String
    let temperature: Double
    let conditionImage: Int
    let coord: [String: Double]
    let country: String
    let timezone: Int
    let description: String
    
    var temperatureAsString: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionImages: String {
        switch conditionImage {
        case 200...231: return "cloud.bolt.fill"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 700...781: return "tornado"
        case 800: return "sun.max"
        default : return "cloud"
        }
    }
    
    var colorOfImages: UIColor {
        switch conditionImage {
        case 200...231: return UIColor.systemBlue
        case 300...321: return UIColor.systemMint
        case 500...531: return UIColor.systemTeal
        case 600...622: return UIColor.white
        case 700...781: return UIColor.systemGray5
        case 800: return UIColor.systemYellow
        default : return UIColor.blue
        }
    }
}
