//
//  MainWindowController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    var loginVC : LoginViewController?
    var createAccountVC : CreateAccountViewController?
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
    loginVC = contentViewController as? LoginViewController
        
    }
    
    func moveToCreateScreen() {
        if createAccountVC == nil {
            createAccountVC = storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "createAccountVC")) as? CreateAccountViewController
        }
        window?.contentView = createAccountVC?.view
    }
    func backToLoginScreen() {
        window?.contentView = loginVC?.view
    }

}
