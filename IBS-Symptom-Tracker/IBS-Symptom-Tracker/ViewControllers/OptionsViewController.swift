//
//  OptionsViewController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // pass in date to all
    }

    @IBAction func onClickAddMeal(_ sender: Any) {
    }
    
    @IBAction func onClickAddSymptom(_ sender: Any) {
        performSegue(withIdentifier: "SegueToSymptom", sender: self)
    }
    
    @IBAction func onClickAddBM(_ sender: Any) {
        performSegue(withIdentifier: "SegueToBM", sender: self)
    }
    
    @IBAction func onClickAddSupplement(_ sender: Any) {
        performSegue(withIdentifier: "SegueToSupplement", sender: self)
    }
}
