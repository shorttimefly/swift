//
//  WeatherApi.swift
//  Weather
//
//  Created by Max on 16/4/6.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

var apiTemp = WeatherModel(city: "beijing", temp: "3" )
var weatherApi = WeatherApi()
class WeatherApi: NSObject{
    typealias Completion = (result: AnyObject?, error: NSError?) -> ()
    
    func  request(cityName: String, completion:Completion){
        let req = NSMutableURLRequest(URL: NSURL(string: "http://apis.baidu.com/apistore/weatherservice/weather?citypinyin=" + cityName )! )
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue("a81d19e6348737b6f835215aeedc55a0", forHTTPHeaderField: "apikey")
        
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in
            if let _ = error{
                print("请求失败")
                completion(result: nil, error: error)
            }
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            let weatherData  = json["retData"]
            //print(weatherData)
            let cityName = weatherData?!.objectForKey("city") as! String
            //let htmpData = weatherData?!.objectForKey("h_tmp") as! String
            //let ltmpData = weatherData?!.objectForKey("l_tmp") as! String
            let temp = weatherData?!.objectForKey("temp") as! String
            //let timeData = weatherData?!.objectForKey("time") as! String
            //let dateData = weatherData?!.objectForKey("date") as! String
            //dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //})
            apiTemp.city = cityName
            apiTemp.temp = temp
            completion(result: apiTemp, error: nil)
            //print(reTemp)
            }
     
            }
    

}
