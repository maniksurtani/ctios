//
//  RootViewController.swift
//  Connectastic
//
//  Created by Manik Surtani on 10/23/14.
//  Copyright (c) 2014 Manik Surtani. All rights reserved.
//
import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate, FBLoginViewDelegate {
    let dataModel = DataModel()
    var pageViewController: UIPageViewController?
    @IBOutlet var fbLoginView : FBLoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded RootVC - waiting for FB login.")
        
        // This is our main entry point.  Load the View as defined in the storyboard, which displays the splash screen + the FB login button, and don't do anything until the user logs in.
        // We will be notified of the user having logged in by the loginViewShowingLoggedInUser() and loginViewFetchedUserInfo() callbacks, defined in FBLoginViewDelegate which we implement here.
        // See implementations of these functions below for details.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UIPageViewController delegate methods

    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .Portrait) || (orientation == .PortraitUpsideDown) || (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
            let currentViewController = self.pageViewController!.viewControllers[0] as UIViewController
            let viewControllers: NSArray = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })

            self.pageViewController!.doubleSided = false
            return .Min
        }
        
        // Still return .Min for now; if we want to do something clever with the UI (split pane view, etc) in Landscape mode, then we could return .Mid instead.
        return .Min
    }
    
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        
        loadConnectastic(user)
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
 
    // This function actually starts loading the Connectastic View, and should only be invoked once Facebook details have been obtained.
    func loadConnectastic(fbUser: FBGraphUser) {
        println("Loading Connectastic main view")
        
        dataModel.setFbUser(fbUser)
        
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.delegate = self

        // Create a new DataViewController
        let startingViewController: DataViewController = storyboard!.instantiateViewControllerWithIdentifier("DataViewController") as DataViewController
        startingViewController.initialize(dataModel);
        
        let viewControllers: NSArray = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMoveToParentViewController(self)

        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = self.pageViewController!.gestureRecognizers
    }
}

