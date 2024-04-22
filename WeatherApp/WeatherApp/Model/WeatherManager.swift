//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Miras Iskakov on 22.04.2024.
//

import Foundation

protocol WeatherManagerDelegate {
    func weatherManagerUpdate(_ weather: WeatherManager, weatherData: WeatherData)
    func weatherErrorHandler(networkError: Error)
}

class WeatherManager {
    
    let baseURL: String = "https://api.openweathermap.org/data/2.5/weather?"
    
    let apiKey = "cd42afe71ef146efab5807f077330243"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let url = "\(baseURL)appid=\(apiKey)&units=metric&q=\(cityName)"
        performRequest(with: url)
    }
    
    func performRequest(with url: String) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if  error != nil {
                self.delegate?.weatherErrorHandler(networkError: error!)
            }
            if let data = data {
                if let weather = self.parseJSON(weatherData: data) {
                    self.delegate?.weatherManagerUpdate(self, weatherData: weather )
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherModel.self, from: weatherData)
            let name = decodedData.name
            let id = decodedData.weather[0].id
            let coord = ["Latitude": decodedData.coord.lat, "Longitude": decodedData.coord.lon]
            let timezone = decodedData.timezone
            let temp = decodedData.main.temp
            let country = decodedData.sys.country
            let description = decodedData.weather[0].description
            
            let weather = WeatherData(name: name, temperature: temp, conditionImage: id, coord: coord, country: country, timezone: timezone, description: description)
            
            return weather
            
        } catch {
            delegate?.weatherErrorHandler(networkError: error)
            return nil
        }
    }
}
