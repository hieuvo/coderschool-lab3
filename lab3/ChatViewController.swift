//
//  ChatViewController.swift
//  lab3
//
//  Created by hvmark on 3/23/16.
//  Copyright © 2016 hvmark. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageText: UITextField!
    
    @IBAction func sendAction(sender: AnyObject) {
        let gameScore = PFObject(className:"Message_Swift_032016")
        gameScore["text"] = messageText.text
        
//        gameScore["playerName"] = "Sean Plott"
//        gameScore["cheatMode"] = false
        
        gameScore.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("send successfully")
            } else {
                print("shit happens")
            }
        }

    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
