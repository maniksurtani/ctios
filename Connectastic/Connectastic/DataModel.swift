// The Model object.  This contains all of the data for a given Connectastic session, while the DataViewController does the hard
// work of talking to Connectastic Endpoints.  Some tasks may be kicked off by the RootViewController (which controls the splash 
// screen and initializes everything), and may populate parts of this model as well.

class DataModel {
    var user: FBSDKProfile?
    var fbToken: String?
    
    init() {
        print("Constructed a data model")
    }
    
    func setUser(user: FBSDKProfile) {
        self.user = user
    }
    
    func setFbToken(fbtoken: String){
        self.fbToken = fbtoken
    }
}
