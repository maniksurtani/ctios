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
            if let pageViewController = self.pageViewController {
                if let viewControllerArray = pageViewController.viewControllers {
                    let currentViewController = viewControllerArray[0]
                    let viewControllers = [currentViewController]
                    pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true) {_ in }
                } else {
                    print("viewControllerArray is nil!!")
                }
                pageViewController.doubleSided = false
            } else {
                print("pageViewController is nil!!")
            }
            return .Min
        }
        
        // Still return .Min for now; if we want to do something clever with the UI (split pane view, etc) in Landscape mode, then we could return .Mid instead.
        return .Min
    }

    func allPermsGranted(perms: Array<String>) -> Bool {
        for perm in self.facebookReadPermissions {
            if !perms.contains(perm) {
                return false
            }
        }
        return true
    }
    
    // Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton?, didCompleteWithResult result: FBSDKLoginManagerLoginResult?, error: NSError?) {
        if let err = error {
            print("Caught error \(err)")
            return
        }
            
        if let _ = result?.isCancelled {
            print("FB login process cancelled")
            return
        }
        
        // If you ask for multiple permissions at once, you
        // should check if specific permissions missing
        if let res = result {
            if allPermsGranted(Array(res.grantedPermissions).map({"\($0)"})) {
                print("Logged into Facebook, all permissions granted.")
            } else {
                print("Logged into Facebook, but only granted permissions \(res.grantedPermissions)")
            }
        } else {
            print("No results from FB!")
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }
    
    // Call anytime to retrieve user data.
    func fetchUserData(notification: NSNotification) {
        let profile = FBSDKProfile.currentProfile()
        if profile != nil {
            self.dataModel.setUser(profile)
            print("fetched user: \(profile.name) ID \(profile.userID)")
            
            self.loadConnectastic()
        } else {
            print("Profile is nil!! How comes?")
        }
    }
    
    // This function actually starts loading the Connectastic View, and should only be invoked once Facebook details have been obtained.
    func loadConnectastic() {
        print("Loading Connectastic main view")
        
        let newViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        
        self.pageViewController = newViewController
        newViewController.delegate = self

        // Create a new DataViewController
        let startingViewController = getDataViewController()
        startingViewController.initialize(dataModel);
        
        let viewControllers = [startingViewController]
        newViewController.setViewControllers(viewControllers, direction: .Forward, animated: false) {_ in }

        self.addChildViewController(newViewController)
        self.view.addSubview(newViewController.view)

        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        
        newViewController.view.frame = pageViewRect
        newViewController.didMoveToParentViewController(self)

        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = newViewController.gestureRecognizers
    }
    
    func getDataViewController() -> DataViewController {
        if let sb = storyboard {
            return sb.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        } else {
            fatalError("Storyboard is nil!")
        }
    }
}

