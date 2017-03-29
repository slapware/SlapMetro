//
//  TabBarController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/21/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var pdata = MtaData()

    override func viewDidLoad() {
        sleep(4)
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
