//
//  CityList.swift
//  weatherTest
//
//  Created by Max on 16/3/29.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

class CityList: UITableView,UITableViewDataSource {

    let Tag_Cell_Label = 1
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
    
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        var label = cell!.viewWithTag(Tag_Cell_Label) as! UILabel
        label.text = "beijing"
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
