//
//  AddCity.swift
//  weatherTest
//
//  Created by Max on 16/3/30.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class AddCity: UITableViewController {

    @IBAction func cancelAddCity(segue: UIStoryboardSegue ){
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveCity(segue: UIStoryboardSegue){
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
