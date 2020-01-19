//
//  BaseViewController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var addItemButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // add things to a stack view based on what comes back from realm
        // all components are gonna have to be created in code or something
        // add buttons and date to the nav
        // add functionality to switch dates
        // if time add in calendar
        
    }

    @IBAction func addItemPressed(_ sender: Any) {
        performSegue(withIdentifier: "SegueToOptions", sender: self)
        
        // pass in date object
    }
}
