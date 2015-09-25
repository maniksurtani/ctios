import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate, FBSDKLoginButtonDelegate {
    let dataModel = DataModel()
    var pageViewController: UIPageViewController?
    let facebookReadPermissions = ["public_profile", "email", "user_friends"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Necessary to ensure profile details are kept up to date. See http://stackoverflow.com/questions/29292371/facebook-sdk-v4-0-for-ios-fbsdkprofile-currentprofile-not-being-set
        FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "fetchUserData:", name:FBSDKProfileDidChangeNotification, object: nil)

        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO(manik): remove when actually building. This forces FB logout every time the app launches.
        FBSDKLoginManager().logOut()
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            // User is already logged in, do work such as go to next view controller.
        } else {
            let loginView = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 200)
            loginView.readPermissions = self.facebookReadPermissions
            loginView.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UIPageViewController delegate methods

    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .Portrait) || (orientation == .PortraitUpsideDown) || (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
            let currentViewController = self.pageViewController!.viewControllers[0] as! UIViewController
            let viewControllers: NSArray = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: {done in })

            self.pageViewController!.doubleSided = false
            return .Min
        }
        
        // Still return .Min for now; if we want to do something clever with the UI (split pane view, etc) in Landscape mode, then we could return .Mid instead.
        return .Min
    }

    func allPermsGranted(perms: Array<String>) -> Bool {
        for perm in self.facebookReadPermissions {
            if !contains(perms, perm) {
                return false
            }
        }
        return true
    }
    
    // Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            println("Caught error \(error)")
        }
        else if result.isCancelled {
            println("FB login process cancelled")
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if allPermsGranted(Array(result.grantedPermissions).map({"\($0)"})) {
                println("Logged into Facebook, all permissions granted.")
            } else {
                println("Logged into Facebook, but only granted permissions \(result.grantedPermissions)")
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    // Call anytime to retrieve user data.
    func fetchUserData(notification: NSNotification) {
        let profile = FBSDKProfile.currentProfile()
        if profile != nil {
            self.dataModel.setUser(profile)
            println("fetched user: \(profile.name) ID \(profile.userID)")
            
            self.loadConnectastic()
        } else {
            println("Profile is nil!! How comes?")
        }
    }
    
    // This function actually starts loading the Connectastic View, and should only be invoked once Facebook details have been obtained.
    func loadConnectastic() {
        println("Loading Connectastic main view")
        
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.delegate = self

        // Create a new DataViewController
        let startingViewController: DataViewController = storyboard!.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        startingViewController.initialize(dataModel);
        
        let viewControllers: NSArray = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: false, completion: {done in })

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

