//
//  DataViewController.swift
//  Connectastic
//
//  Created by Manik Surtani on 10/23/14.
//  Copyright (c) 2014 Manik Surtani. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: AnyObject?

    override func viewDidLoad() {
        print("Loaded DataViewController")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

