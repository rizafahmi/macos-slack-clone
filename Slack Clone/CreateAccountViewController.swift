//
//  CreateAccountViewController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa

class CreateAccountViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func loginButtonClick(_ sender: NSButton) {
        if let mainVC = view.window?.windowController as? MainWindowController {
            mainVC.backToLoginScreen()
        }
    }
}
