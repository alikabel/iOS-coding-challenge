//
//  HTTPClient.swift
//  AutoLabs
//
//  Created by Ali Kabel on 19.07.18.
//  Copyright © 2018 Ali Kabel. All rights reserved.
//

import UIKit

class HTTPClient: NSObject {
    static let shared = HTTPClient()
    var onGetCityDetailsSuccess: ((City)->())?
    // MARK:- API Calls
    func getCityWeatherData(_ cityName: String) {
        var city: City!
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)"
        guard let url = URL(string: urlString) else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                print(data)
                city = try JSONDecoder().decode(City.self, from: data)
                DispatchQueue.main.async {
                    self.onGetCityDetailsSuccess!(city)
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
    }
}
