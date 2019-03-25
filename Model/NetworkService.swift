//
//  NetworkService.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 23/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    enum City: String {
        case london = "London"
    }
    
    private let API_KEY = "4bc5e9fbb6356c11608652020cd39f98"
    
    // Ideally, URL of an API needs to have a query builder function. But, for simplicity let's keep it as a magic variable for now.
    private let BASE_API_URL = "https://api.openweathermap.org/data/2.5"
    private let FORECAST_API = "/forecast"
    
    private init() { }
    
    private func getURLString(for apiName: String) -> String {
        return BASE_API_URL + apiName
    }
    
    func downloadingWeatherData(for city: City, _ completion: @escaping ([FiveDaysForeCast]) -> Void) {
        
        func completionOnMainThread(_ data: [FiveDaysForeCast]) {
            DispatchQueue.main.async {
                completion(data)
            }
        }
        
        var urlString = getURLString(for: FORECAST_API)
        urlString += "?q=\(city.rawValue)&mode=json&APPID=\(API_KEY)"
        
        guard let Url = URL(string: urlString) else {
            completion([])
            return
        }
        
        let session = URLSession.shared.dataTask(with: Url) { (data, response, error) in
            if let err = error {
                print("failed to download the data \(err)")
                completionOnMainThread([])
                return
            }
            if let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode != 200 { // HTTP_OK
                let respError = "dataTaskWithRequest HTTP status code: \(httpUrlResponse.statusCode)"
                print(respError)
                completionOnMainThread([])
                return
            }
            guard let data = data else {
                print("Data is NIL")
                completionOnMainThread([])
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherDatas = try decoder.decode(WeatherForeCastResults.self, from: data)
                DispatchQueue.main.async {
                    completionOnMainThread(weatherDatas.list)
                }
            } catch let decodingError {
                print("failed to decode the json data \(decodingError)")
                completionOnMainThread([])
            }
        }
        session.resume()
    }
}
