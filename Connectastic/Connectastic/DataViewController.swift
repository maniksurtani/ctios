//
//  DataViewController.swift
//  Connectastic
//
//  Created by Manik Surtani on 10/23/14.
//  Copyright (c) 2014 Manik Surtani. All rights reserved.
//

// Facebook integration tips from http://www.brianjcoleman.com/tutorial-facebook-login-in-swift/

import UIKit

class DataViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet var fbLoginView : FBLoginView!
    var dataObject: AnyObject?

    override func viewDidLoad() {
        print("Loaded DataViewController")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Facebook login
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description + "Blah"
        } else {
            self.dataLabel!.text = "EMPTY!"
        }        
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
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
}

