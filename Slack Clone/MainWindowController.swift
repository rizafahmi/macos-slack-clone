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
    var splitVC : SplitViewController?
    
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
    func moveToChatScreen() {
        if splitVC == nil {
            splitVC = storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "splitVC")) as? SplitViewController
        }
        window?.contentView = splitVC?.view
    }

}
