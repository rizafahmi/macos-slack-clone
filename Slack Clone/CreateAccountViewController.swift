//
//  CreateAccountViewController.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa
import Parse

class CreateAccountViewController: NSViewController {

    @IBOutlet weak var userImageView: NSImageView!
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var emailTextField: NSTextField!
    var profilePic : PFFile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func jpegDataFrom(image:NSImage) -> Data {
        let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
    }
    
    @IBAction func loginButtonClick(_ sender: NSButton) {
        if let mainVC = view.window?.windowController as? MainWindowController {
            mainVC.backToLoginScreen()
        }
    }
    @IBAction func chooseImageClick(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = true
        openPanel.begin { (result) in
            if result == NSApplication.ModalResponse.OK {
                if let imageUrl = openPanel.urls.first {
                    if let image = NSImage(contentsOf: imageUrl) {
                        self.userImageView.image = image
                        
                        let imageData = self.jpegDataFrom(image: image)
                        
                        self.profilePic = PFFile(data: imageData)
                        self.profilePic?.saveInBackground()
                    }
                }
            }
            
        }
    }
    @IBAction func createAccountClick(_ sender: NSButton) {
        PFUser.logOut()
        let user = PFUser()
        user.email = emailTextField.stringValue
        user.password = passwordTextField.stringValue
        user.username = emailTextField.stringValue
        user["name"] = nameTextField.stringValue
        user["image"] = self.profilePic
        
        user.signUpInBackground {(success:Bool, error:Error?) in
            if success {
                print("Made a user!")
                if let mainVC = self.view.window?.windowController as? MainWindowController {
                    mainVC.moveToChatScreen()
                }
            } else {
                print("We have a problem")
            }
        }
    }
}
