//
//  AppDelegate.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let collection = NSFontCollection(name: NSFontCollection.Name(rawValue: "Fixed Width"))
        var names = [String]()
        for description in (collection?.matchingDescriptors)!{
            let name = description.fontAttributes[NSFontDescriptor.AttributeName.name] as! String
            names.append(name)

        }
        print(names)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

