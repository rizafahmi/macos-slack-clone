//
//  LoginViewController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountButtonClick(_ sender: NSButton) {
        if let mainVC = view.window?.windowController as? MainWindowController {
            mainVC.moveToCreateScreen()
        }
    }
    

}

