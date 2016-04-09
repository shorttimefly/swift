//
//  WeatherData.swift
//  Weather
//
//  Created by Max on 16/4/7.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class WeatherData: NSObject {
    var citytemp = [WeatherModel]()
    override init() {
        let citytemp1 = WeatherModel(city:"beijing",temp: "loading")
        let citytemp2 = WeatherModel(city:"guangzhou",temp: "loading")
        let citytemp3 = WeatherModel(city:"suzhou",temp: "loading")
        let citytemp4 = WeatherModel(city:"shenzhen",temp: "loading")
        let citytemp5 = WeatherModel(city:"nanjing",temp: "loading")
        citytemp = [citytemp1,citytemp2,citytemp3,citytemp4,citytemp5]
    }
    
    func getCityTemp() -> [WeatherModel]{
        return citytemp
    }
    
    func addCity(city:String){
        let citytempx = WeatherModel(city: city, temp: "loading")
        citytemp.append(citytempx)
    }
    
//    func tempApi(){
//        for index in 0...citytemp.count-1 {
//        let city = citytemp[index].city
//            dispatch_async(dispatch_get_main_queue(),{ () -> Void in
//               weatherApi.request(city!)
//            })
//                print("ok")
    
    
    }
