//
//  CityNameData.swift
//  Weather
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class CityNameData: NSObject {
    var cityName = [CityNameModel]()
    override init() {
        var cityName1 = CityNameModel(name: "beijing")
        var cityName2 = CityNameModel(name: "guangzhou")
        cityName = [cityName1,cityName2]
    }
    func reloadCity(){
    
    }
    
    }
