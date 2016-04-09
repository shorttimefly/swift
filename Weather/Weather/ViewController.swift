//
//  ViewController.swift
//  Weather
//
//  Created by Max on 16/4/5.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

var cityDetail: WeatherModel?

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = cityDetail?.city
      //  tempLabel.text = weatherApi.request(cityDetail?.city, completion: completion)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

