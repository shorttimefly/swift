//
//  ChooseCity.swift
//  Weather
//
//  Created by Max on 16/4/5.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

var cityNameData = [String]()
class ChooseCity: UITableViewController {
    
    var choosecity: String?
    var choosecityindex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameData = ["beijing","nanjing","suzhou","hangzhou","guangzhou","shenzhen","zhuhai","zhongshan"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityNameData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityName", forIndexPath: indexPath)

        if let cityNameLabel = cell.viewWithTag(102) as? UILabel{
            cityNameLabel.text = cityNameData[indexPath.row]        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PickCity" {
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPathForCell(cell)
                
                if let index = indexPath?.row{
                choosecity = cityNameData[index]
                }
            
            }
            
    
        }

    }

}