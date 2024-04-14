//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Miras Iskakov on 15.04.2024.
//

import Foundation

struct WeatherModel: Decodable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let timezone: Int
    let name: String
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}

struct Main: Decodable {
    let temp: Double
}

struct Sys: Decodable {
    let country: String
}
