//
//  WeatherModel.swift
//  Weather
//
//  Created by Max on 16/4/8.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class WeatherModel: NSObject {
    var city: String?
    var temp: String?
    init(city: String, temp: String) {
        super.init()
        self.city = city
        self.temp = temp

    }
}
