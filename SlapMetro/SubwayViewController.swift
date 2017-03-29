//
//  SubwayViewController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/22/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class SubwayViewController: UITableViewController {
    var subwayArray: [Line] = []
    let cellReuseIdentifier = "subcell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // MARK: Obtain pdata from tabbarController -
        let tbvc = tabBarController as! TabBarController
        self.subwayArray = tbvc.pdata.subwayArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subwayArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let cell:SubwayTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! SubwayTableViewCell
        
        // Configure the cell...
        let entry = subwayArray[indexPath.row]
        cell.SubwayLine?.text = entry.name
        cell.SubwayStatus?.text = entry.status
        cell.SubwayImage?.image = UIImage(named: entry.name)

        if( entry.status == "GOOD SERVICE" )
        {
            cell.SubwayStatus.textColor = UIColor.green
        }
        
        if( entry.status == "PLANNED WORK" )
        {
            cell.SubwayStatus.textColor = UIColor.orange
        }
        
        if( entry.status == "SERVICE CHANGE" )
        {
            cell.SubwayStatus.textColor = UIColor.purple
        }
        
        if( entry.status == "SUSPENDED" )
        {
            cell.SubwayStatus.textColor = UIColor.red
        }
        
        if( entry.status == "DELAYS" )
        {
            cell.SubwayStatus.textColor = UIColor.red
        }

        return cell
    }
    
    // MARK: Refresh data -
    @IBAction func refresh(_ sender: Any) {
        self.subwayArray.removeAll()
        let tbvc = tabBarController as! TabBarController
        tbvc.pdata.refresh()
        sleep(3)
        self.subwayArray = tbvc.pdata.subwayArray
        self.tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     // Do here
     }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toSubDetail" {
            
            let nav = segue.destination as! UINavigationController
            let destination = nav.topViewController as! SubwayDetailViewController
            
            let row = tableView.indexPathForSelectedRow?.row
            destination.message = self.subwayArray[row!].text
            
        }
    }


}
