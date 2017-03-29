//
//  LirrViewController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/21/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class LirrViewController: UITableViewController {
    var lirrArray: [Line] = []
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // MARK: Obtain pdata from tabBarController -
        let tbvc = tabBarController as! TabBarController
        self.lirrArray = tbvc.pdata.lirrArray


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
        return lirrArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell:LirrTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! LirrTableViewCell

        // Configure the cell...
        let entry = lirrArray[indexPath.row]
        cell.LineLabel?.text = entry.name
        cell.LineStatus?.text = entry.status
        
        let greenImage = UIImage(named: "traffic_green_tran.png")
        let yellowImage = UIImage(named: "traffic_yellow_tran.png")
        let redImage = UIImage(named: "traffic_red_tran.png")
        
        if( entry.status == "GOOD SERVICE" )
        {
            cell.LineStatus.textColor = UIColor.green
            cell.LineImage?.image = greenImage;
        }
        
        if( entry.status == "PLANNED WORK" )
        {
            cell.LineStatus.textColor = UIColor.orange
            cell.LineImage?.image = yellowImage;
        }
        
        if( entry.status == "SERVICE CHANGE" )
        {
            cell.LineStatus.textColor = UIColor.orange
            cell.LineImage?.image = yellowImage;
        }
        
        if( entry.status == "SUSPENDED" )
        {
            cell.LineStatus.textColor = UIColor.red
            cell.LineImage?.image = redImage;
        }
        
        if( entry.status == "DELAYS" )
        {
            cell.LineStatus.textColor = UIColor.red
            cell.LineImage?.image = redImage;
        }
        
        return cell
    }
    
// MARK: Refresh data -
    @IBAction func refresh(_ sender: Any) {
        self.lirrArray.removeAll()
        let tbvc = tabBarController as! TabBarController
        tbvc.pdata.refresh()
        sleep(3)
        self.lirrArray = tbvc.pdata.lirrArray
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

    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do here
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toLirrDetail" {
            
            let nav = segue.destination as! UINavigationController
            let destination = nav.topViewController as! LirrDetailViewController
            
            let row = tableView.indexPathForSelectedRow?.row
            destination.message = self.lirrArray[row!].text
            
        }
    }
    

}
