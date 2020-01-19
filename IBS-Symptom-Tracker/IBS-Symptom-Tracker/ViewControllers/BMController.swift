//
//  BMController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class BMController: UIViewController {
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var NotesLabel: UILabel!
    let notesInput = UITextView(frame: CGRect(x: 20, y: 200, width: 374.0, height: 170.0))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add textview to add notes about the bowel movement
        notesInput.layer.borderWidth = 1
        notesInput.layer.borderColor = UIColor.black.cgColor
        notesInput.font = .systemFont(ofSize: 18)
        
        
//        view.addSubview(notesInput)
        
        // Edit Add button
        AddButton.layer.borderColor = UIColor.black.cgColor
        AddButton.layer.borderWidth = 1
        AddButton.layer.cornerRadius = 5
        
        navigationItem.title = "Add Bowel Movement"
        
        
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 16.0

        stackView.addArrangedSubview(NotesLabel)
        stackView.addArrangedSubview(notesInput)
        stackView.addArrangedSubview(AddButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    @IBAction func onClick(_ sender: Any) {
        let realm = try! Realm()
        
        try! realm.write {
            let newBowelMovement = BowelMovement()
            newBowelMovement.notes = notesInput.text
            newBowelMovement.day = dayObject
            
            realm.add(newBowelMovement)
        }
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
}

