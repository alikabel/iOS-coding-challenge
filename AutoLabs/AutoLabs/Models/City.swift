//
//  City.swift
//  AutoLabs
//
//  Created by Ali Kabel on 19.07.18.
//  Copyright © 2018 Ali Kabel. All rights reserved.
//

import UIKit

class City: Codable {
    let main: Main
    let visibilty: Float
    
    init(main: Main, visibilty: Float) {
        self.main = main
        self.visibilty = visibilty
    }
}
