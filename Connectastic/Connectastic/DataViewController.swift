import UIKit

class DataViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var dataLabel: UILabel!  // Generated by the XCode template
    @IBOutlet var loginMessage: UILabel!  // To display a message if the user isn't logged in
    var dataModel: DataModel? // Make this optional; we will initialize later

    override func viewDidLoad() {
        print("Loaded DataViewController")
        super.viewDidLoad()
        
        // TODO Do this using the designer, not in code
        // Set up FB logout and profile pic UI elements
        let loginView = FBSDKLoginButton()
        self.view.addSubview(loginView)
        loginView.delegate = self
        loginView.center = self.view.center
        loginView.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear() hit.")
        if let user = self.dataModel?.user {
            dataLabel.text = "Welcome, " + user.name
//            fbProfilePicView.hidden = false
            dataLabel.hidden = false
            loginMessage.hidden = true
            self.saveFbToken()
        } else {
//            fbProfilePicView.hidden = true
            dataLabel.hidden = true
            print("fbUser not set!  How did we get here?")
        }
    }
    
    func initialize(dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    // Disables all UI elements on this screen by greying them out or hiding them.  Also see viewWillAppear(), which does the opposite.
    func disableScreen() {
//        fbProfilePicView.hidden = true
        dataLabel.hidden = true
        loginMessage.hidden = false
        loginMessage.numberOfLines = 0
    }
    
    
    //Login to connectastic using endpoint library
    func loginToConnectastic() {
        if dataModel?.fbToken != nil {
            let service = GTLServiceAuth()
            service.retryEnabled = true
            
            let request = GTLAuthConnectasticAuthReq()
            let dm = self.dataModel!

            request.fbId = Int((dm.user?.userID!)!)
            request.token = dm.fbToken
            
            let query = GTLQueryAuth.queryForLoginWithObject(request) as! GTLQueryAuth
            
            service.executeQuery(query, completionHandler: { (ticket: GTLServiceTicket!, rsp: AnyObject!, error: NSError!) -> Void in
                if error != nil {
                    print("ExecuteQuery: result is nil")
                    return
                }
                let result = rsp as! GTLAuthConnectasticAuthRsp
                print("\(result.name) has logged into Connectastic. Status: \(result.loggedIn)")
            })
        }
    }
        
    //Store the fb token of the current session in the data model
    func saveFbToken() {
        let token = FBSDKAccessToken.currentAccessToken().tokenString
        print("Current session token:  \(token)")
        dataModel!.setFbToken(token)
        loginToConnectastic()
    }
    
    // Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("How did we get here?")
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        // TODO transition to splash screen
    }
}

