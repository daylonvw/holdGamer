//
//  brandsInformationTableTableViewController.swift
//  holdGames
//
//  Created by daylonvanwel on 09-02-15.
//  Copyright (c) 2015 daylon wel. All rights reserved.
//

import UIKit

class brandsInformationTableTableViewController: UITableViewController {
    
    var currentBrand : Brand!

    override func viewDidLoad() {
      
        super.viewDidLoad()
        
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
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 4
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if indexPath.row == 0{
            
            return self.view.frame.size.width
        
        }
        
        if indexPath.row > 0 {
            
            return 60.0
        }
        
        return 60.0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 18.0)!

        
        if indexPath.row == 0 {
            
            
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width))
            imageView.image = currentBrand.image
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            cell.addSubview(imageView)
            
            let timeString = "Waiting time is \(currentBrand.waiTingTime) minutes"
            var timeLabel = UILabel(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
            timeLabel.text = timeString
            timeLabel.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
            timeLabel.textColor = UIColor.whiteColor()
            timeLabel.textAlignment = NSTextAlignment.Center
            timeLabel.font = UIFont(name: "HelveticaNeue", size: 16.0)!
            cell.addSubview(timeLabel)

            
        }
        
        if indexPath.row == 1 {
            

            cell.textLabel?.text = currentBrand.name
            
        }
        
        if indexPath.row == 2 {
            
            cell.textLabel?.text = "Call: 0\(currentBrand.phoneNumber)"
        }
        
        if indexPath.row == 3 {
            
            cell.textLabel?.text = "Go to website"
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 2 {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://0\(currentBrand.phoneNumber)")!)

        }
        
        if indexPath.row == 3 {
            
            UIApplication.sharedApplication().openURL(NSURL(string: currentBrand.url)!)
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
