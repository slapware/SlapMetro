//
//  BridgeDetailViewController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/26/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class BridgeDetailViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet var message: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        webView.autoresizesSubviews = true

        if self.message! == " " {
            self.webView.loadRequest(URLRequest(url: URL(string: "http://m.mta.info/mt/www.mta.info")!))
        }
        else {
            self.webView.loadHTMLString(self.message, baseURL: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
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
