//
//  LoginViewController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa
import Parse

class LoginViewController: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountButtonClick(_ sender: NSButton) {
        if let mainVC = view.window?.windowController as? MainWindowController {
            mainVC.moveToCreateScreen()
        }
    }
    @IBAction func loginClick(_ sender: NSButton) {
        PFUser.logInWithUsername(inBackground: emailTextField.stringValue, password: passwordTextField.stringValue) { (user:PFUser?, error:Error?) in
            if error == nil {
                print("You logged in!")
            } else {
                print("There's a problem, couldn't log in")
            }
        }
    }
    

}

