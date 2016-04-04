//
//  PlayersViewController.swift
//  GamePlay
//
//  Created by Max on 16/3/30.
//  Copyright © 2016年 Max. All rights reserved.
//

import UIKit

var players: [ Player] = playersData

class PlayersViewController: UITableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
  
    //the call step
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        let player = players[indexPath.row] as Player
        if let Label_Name = cell.viewWithTag(100) as? UILabel{
            Label_Name.text = player.name
        }
        if let Label_Game = cell.viewWithTag(101) as? UILabel{
            Label_Game.text = player.game
        }
        
        if let Image_Rating = cell.viewWithTag(102) as? UIImageView{
            Image_Rating.image = self.imageForRating(player.rating!)
        }
        
        return cell
    }
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)stars"
        return UIImage(named: imageName)
    }
    
    @IBAction func cancelToList(segue: UIStoryboardSegue){
    
    }
    
    @IBAction func savePlayer(segue: UIStoryboardSegue){
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController{
            if let player = playerDetailsViewController.player{
            players.append(player)
            }
        }
        
        let indexPath = NSIndexPath(forRow: players.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic )
        
        
    }
    
}

