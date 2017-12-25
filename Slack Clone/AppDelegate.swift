//
//  AppDelegate.swift
//  Slack Clone
//
//  Created by Riza Fahmi on 12/24/17.
//  Copyright © 2017 hacktiv8. All rights reserved.
//

import Cocoa
import Parse

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let config = ParseClientConfiguration { (
            configThing: ParseMutableClientConfiguration) in
            configThing.applicationId = "slackcloneappid"
            configThing.server = "http://slackclone2202.herokuapp.com/parse"
        }
        Parse.initialize(with: config)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

