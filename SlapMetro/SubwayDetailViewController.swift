//
//  SubwayFetailViewController.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/22/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit
import MessageUI

class SubwayDetailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet var message: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // MARK: - Webview sizing
        WebView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        WebView.autoresizesSubviews = true

        // MARK: - Webview message contents
        if self.message! == " " {
            self.WebView.loadRequest(URLRequest(url: URL(string: "http://m.mta.info/mt/www.mta.info")!))
        }
        else {
            self.WebView.loadHTMLString(self.message, baseURL: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Webview sizing
    override func viewDidLayoutSubviews() {
        WebView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    // MARK: Send the email
    @IBAction func sendMail(_ sender: Any) {
        var emailTo: String
        var emailCC: String
        if MFMailComposeViewController.canSendMail() {
            let defaults = UserDefaults.standard
            if let emTo = defaults.string(forKey: "Subway_To") {
                emailTo = emTo
            }
            else {
                emailTo = ""
            }
            if let emCc = defaults.string(forKey: "Subway_CC") {
                emailCC = emCc
            }
            else {
                emailCC = ""
            }
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([emailTo])
            mail.setCcRecipients([emailCC])
            mail.setSubject("Subway trouble")
            mail.setMessageBody(message!, isHTML: true)
            
            present(mail, animated: true)
        } else {
            let alertController = UIAlertController(title: "Unable to Send", message: "Check email settings?", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
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
