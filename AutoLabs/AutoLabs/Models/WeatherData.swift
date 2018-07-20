//
//  WeatherData.swift
//  AutoLabs
//
//  Created by Ali Kabel on 19.07.18.
//  Copyright © 2018 Ali Kabel. All rights reserved.
//

import UIKit

class Main: Codable {
    let temp: Float
    let pressure: Float
    
    
    init(temp: Float, pressure: Float) {
        self.temp = temp
        self.pressure = pressure
    }
}
