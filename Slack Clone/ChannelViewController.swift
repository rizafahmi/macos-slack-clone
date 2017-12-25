//
//  ChannelViewController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/25/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa
import Parse

class ChannelViewController: NSViewController {

    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var profileImageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear() {
        if let user = PFUser.current() {
            if let name = user["name"] as? String {
                nameTextField.stringValue = name
            }
            if let imageFile = user["image"] as? PFFile {
                imageFile.getDataInBackground(block: { (data:Data?, error:Error?) in
                    if error == nil {
                        if data != nil {
                            let image = NSImage(data: data!)
                            self.profileImageView.image = image
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func logoutClick(_ sender: NSButton) {
        PFUser.logOut()
        
        if let mainWC = view.window?.windowController as? MainWindowController {
            mainWC.backToLoginScreen()
        }
    }
}
