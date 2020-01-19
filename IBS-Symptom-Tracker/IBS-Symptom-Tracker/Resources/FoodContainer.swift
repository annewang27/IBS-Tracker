//
//  FoodContainer.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-19.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit

class FoodContainer: UIStackView{
    var foodNameInput: UITextField!
    var amountInput: UITextField!
    var notesInput: UITextField!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 372.67, height: 90))
        self.axis = NSLayoutConstraint.Axis.vertical
        self.distribution = UIStackView.Distribution.fillEqually
        self.alignment = UIStackView.Alignment.fill
        self.spacing = 0.0
        
        foodNameInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        foodNameInput.placeholder = " Enter food here..."
        foodNameInput.borderStyle = .line
        foodNameInput.font = .systemFont(ofSize: 18)
        foodNameInput.backgroundColor = UIColor(named: "BodyColour")
        foodNameInput.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(foodNameInput)
        
        amountInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        amountInput.placeholder = " Amount eaten..."
        amountInput.borderStyle = .line
        amountInput.font = .systemFont(ofSize: 18)
        amountInput.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(amountInput)
        
        notesInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        notesInput.placeholder = " Any additional notes...."
        notesInput.borderStyle = .line
        notesInput.font = .systemFont(ofSize: 18)
        notesInput.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(notesInput)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
