//
//  ModelController.swift
//  Connectastic
//
//  Created by Manik Surtani on 10/23/14.
//  Copyright (c) 2014 Manik Surtani. All rights reserved.
//

import UIKit

/*
The Model object.  This contains all of the data for a given Connectastic session, while the DataViewController does the hard work of talking to Connectastic Endpoints.  Some tasks may be kicked off by the RootViewController (which controls the splash screen and initializes everything), and may populate parts of this midel as well.
 */


class DataModel {
    var fbUser: FBGraphUser?
    var fbToken: String?
    
    init() {
        println("Constructed a data model")
    }
    
    func setFbUser(fbUser: FBGraphUser) {
        self.fbUser = fbUser
    }
    
    func setFbToken(fbtoken: String){
        self.fbToken = fbtoken
    }
}

