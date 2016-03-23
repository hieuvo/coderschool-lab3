//
//  ViewController.swift
//  lab3
//
//  Created by hvmark on 3/23/16.
//  Copyright © 2016 hvmark. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

   
    @IBAction func loginAction(sender: AnyObject) {
        
        let loginSuccess = UIAlertAction(title: "Login Success", style: .Default, handler:  {(action) in
            
        })
//
//
        let loginFail = UIAlertAction(title: "Login Fail", style: .Default, handler:  {(action) in
            
        })
        PFUser.logInWithUsernameInBackground(txtEmail.text!  , password: txtPassword.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let alertController = UIAlertController(title: "Login Success", message: "Success", preferredStyle: .Alert)
                alertController.addAction(loginSuccess)
               self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Login Fail", message: "Error", preferredStyle: .Alert)
                alertController.addAction(loginFail)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }

        
        
        
        
    }

    @IBAction func signUpAction(sender: AnyObject) {
        let loginSuccess = UIAlertAction(title: "Sign Up Success", style: .Default, handler:  {(action) in
            
        })
        
        let loginFail = UIAlertAction(title: "Sign Up Fail", style: .Default, handler:  {(action) in
            
        })

        var user = PFUser()
        user.username = txtEmail.text
        user.email = txtEmail.text
        user.password = txtPassword.text
        
        user.signUpInBackgroundWithBlock{
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                let alertController = UIAlertController(title: "Sign Up Fail", message: "Error", preferredStyle: .Alert)
                alertController.addAction(loginFail)
                self.presentViewController(alertController, animated: true, completion: nil)
            }else {
                let alertController = UIAlertController(title: "Sign Up Success", message: "Success", preferredStyle: .Alert)
                alertController.addAction(loginSuccess)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

}

