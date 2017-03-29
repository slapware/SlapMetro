//
//  BridgeViewController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/26/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class BridgeViewController: UITableViewController {
    var bridgeArray: [Line] = []
    let cellReuseIdentifier = "bridgecell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let tbvc = tabBarController as! TabBarController
        self.bridgeArray = tbvc.pdata.bridgeArray
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
        return bridgeArray.count
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.bridgeArray.removeAll()
        let tbvc = tabBarController as! TabBarController
        tbvc.pdata.refresh()
        sleep(3)
        self.bridgeArray = tbvc.pdata.bridgeArray
        self.tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell:BridgeTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! BridgeTableViewCell
        
        // Configure the cell...
        let entry = bridgeArray[indexPath.row]
        cell.bridgeLabel?.text = entry.name
        cell.bridgeStatus?.text = entry.status

        let greenImage = UIImage(named: "traffic_green_tran.png")
        let yellowImage = UIImage(named: "traffic_yellow_tran.png")
        let redImage = UIImage(named: "traffic_red_tran.png")
        
        if( entry.status == "GOOD SERVICE" )
        {
            cell.bridgeStatus.textColor = UIColor.green
            cell.bridgeImage?.image = greenImage;
        }
        
        if( entry.status == "PLANNED WORK" )
        {
            cell.bridgeStatus.textColor = UIColor.orange
            cell.bridgeImage?.image = yellowImage;
        }
        
        if( entry.status == "SERVICE CHANGE" )
        {
            cell.bridgeStatus.textColor = UIColor.orange
            cell.bridgeImage?.image = yellowImage;
        }
        
        if( entry.status == "SUSPENDED" )
        {
            cell.bridgeStatus.textColor = UIColor.red
            cell.bridgeImage?.image = redImage;
        }
        
        if( entry.status == "DELAYS" )
        {
            cell.bridgeStatus.textColor = UIColor.red
            cell.bridgeImage?.image = redImage;
        }
        
        return cell
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

    
    // MARK: - Navigation tobridgedetail

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tobridgedetail" {
            
            let nav = segue.destination as! UINavigationController
            let destination = nav.topViewController as! BridgeDetailViewController
            
            let row = tableView.indexPathForSelectedRow?.row
            destination.message = self.bridgeArray[row!].text
        }
    }
    

}
