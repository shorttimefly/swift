//
//  NetManager.swift
//  weatherTest
//
//  Created by Max on 16/3/29.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class NetManager: NSObject {
    
    var url = "http://apis.baidu.com/apistore/weatherservice/weather"
    var httpArg = "citypinyin=beijing"
    func  request(httpUrl: String, httpArg: String) {
        let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue("a81d19e6348737b6f835215aeedc55a0", forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in
            //            let res = response as! NSHTTPURLResponse
            //            print(res.statusCode)
            if let _ = error{
                print("请求失败")
            }
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            
            let weatherData  = json["retData"]
            print(weatherData!)
            
            let cityData = weatherData?!.objectForKey("city") as! String
            //            let htmpData = weatherData?!.objectForKey("h_tmp") as! String
            //            let ltmpData = weatherData?!.objectForKey("l_tmp") as! String
            let tempData = weatherData?!.objectForKey("temp") as! String
            //            let timeData = weatherData?!.objectForKey("time") as! String
            //            let dateData = weatherData?!.objectForKey("date") as! String
            //
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //self.cityLabel.text = cityData
               // self.tempLabel.text = tempData
            })
        }
}
}
