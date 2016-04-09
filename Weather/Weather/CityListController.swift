//
//  CityListController.swift
//  Weather
//
//  Created by Max on 16/4/5.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

var weatherData = WeatherData()

class CityListController: UITableViewController {
    var city : String?
    override func viewDidLoad() {
        super.viewDidLoad()
//weatherApi.request("beijing")
  //          print(reTemp)
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
        return weatherData.citytemp.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityListCell", forIndexPath: indexPath)
        let city = weatherData.citytemp[indexPath.row]
        if let CityNameLabel = cell.viewWithTag(100) as? UILabel{
                    CityNameLabel.text = city.city!
              }
        
        if let cityTempLabel = cell.viewWithTag(101) as? UILabel{
        weatherApi.request(city.city!) { (result, error) -> () in
            if let _ = error {
                print(error)
                } else {
                    let cityTemp = result as! WeatherModel
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    cityTempLabel.text = cityTemp.temp!

                    })
                    }
            }
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let index = indexPath.row
         cityDetail = weatherData.citytemp[index]
        print((cityDetail?.city)! + (cityDetail?.temp)!)
        }
        
    
    
    func backCityList(segue: UIStoryboardSegue){
    
    }
    
   @IBAction func pickCity(segue:UIStoryboardSegue){
        if let pickcity = segue.sourceViewController as? ChooseCity , choosecity = pickcity.choosecity{
            city = choosecity
            weatherData.addCity(city!)
        }
        
        let indexPath = NSIndexPath(forRow: weatherData.citytemp.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic )

    }

}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


