//
//  SupplementController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SupplementController: UIViewController {
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var SupplementLabel: UILabel!
    @IBOutlet weak var SupplementName: UITextField!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var TypeInput: UITextField!
    @IBOutlet weak var NotesLabel: UILabel!
    
    let notesInput = UITextView(frame: CGRect(x: 20, y: 400, width: 374.0, height: 170.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notesInput.layer.borderWidth = 1
        notesInput.layer.borderColor = UIColor.black.cgColor
        notesInput.font = .systemFont(ofSize: 18)
        
        view.addSubview(notesInput)
        
        // Edit Add button
        AddButton.layer.borderColor = UIColor.black.cgColor
        AddButton.layer.borderWidth = 1
        AddButton.layer.cornerRadius = 5
        
        navigationItem.title = "Add Supplement"
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 16.0

        stackView.addArrangedSubview(SupplementLabel)
        stackView.addArrangedSubview(SupplementName)
        stackView.addArrangedSubview(TypeLabel)
        stackView.addArrangedSubview(TypeInput)
        stackView.addArrangedSubview(NotesLabel)
        stackView.addArrangedSubview(notesInput)
        stackView.addArrangedSubview(AddButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    @IBAction func onClickAdd(_ sender: Any) {
        let realm = try! Realm()
            
        try! realm.write {
            let newSupplement = Supplement()
            newSupplement.notes = notesInput.text
            newSupplement.type = TypeInput.text!
            newSupplement.name = SupplementName.text!
            
            realm.add(newSupplement)
            // need to pass day in from previous view controller
        }
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
