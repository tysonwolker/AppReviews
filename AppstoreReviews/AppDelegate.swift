//
//  AppDelegate.swift
//  AppstoreReviews
//
//  Created by Knut Inge Grosland on 2015-04-08.
//  Copyright (c) 2015 Cocmoc. All rights reserved.
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var settingsWindowController: NSWindowController = self.initialSettingsWindowController()
    lazy var aboutWindowController: NSWindowController = self.initialAboutWindowController()
    lazy var reviewsWindowController: NSWindowController = self.initialReviewWindowController()

    var statusMenuController: StatusMenuController!
    var reviewUpdater: ReviewUpdater!
    
    // MARK : Application Process

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        // Create database singleton object
        let sharedInstance = DBController.sharedInstance
        
        // Create StatusMenu
        self.statusMenuController = StatusMenuController()
        
        // Create ReviewUpdater
        self.reviewUpdater = ReviewUpdater()
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
        // Saves changes in the application's managed object context before the application terminates.
        DBController.sharedInstance.saveContext()
        
        return .TerminateNow
    }
}

// MARK : WindowControllers

extension AppDelegate {
    
    func initialSettingsWindowController() -> NSWindowController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        var windowController = storyboard.instantiateControllerWithIdentifier("SettingsWindowsController") as! NSWindowController
        
        return windowController
    }
    
    func initialReviewWindowController() -> NSWindowController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        var windowController = storyboard.instantiateControllerWithIdentifier("ReviewWindowsController") as! NSWindowController
        
        return windowController
    }
    
    func initialAboutWindowController() -> NSWindowController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        var windowController = storyboard.instantiateControllerWithIdentifier("ReviewWindowsController") as! NSWindowController
        
        return windowController
    }
}
