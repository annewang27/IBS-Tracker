//
//  MealController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MealController: UIViewController {
    
    @IBOutlet weak var MealNameLabel: UILabel!
    @IBOutlet weak var MealNameInput: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var AddFood: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    var foodObjects: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 16.0
        
        AddButton.layer.borderColor = UIColor.black.cgColor
        AddButton.layer.borderWidth = 1
        AddButton.layer.cornerRadius = 5
        
//        stackView.addArrangedSubview(<#T##view: UIView##UIView#>)
        scrollView.addSubview(stackView)
        
        // add in meal name, option to add more food, final add button on storyboard
        // create programatic version of add food controller
        // pass in meal to all food
        

        
        
    }
    
    @IBAction func onClickAddMeal(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickAddFood(_ sender: Any) {
        // add another thing to the stack view
    }
    
    func createFoodContainer() -> Food{
        let newFood = Food()
        
        let foodContainer = UIStackView()
        foodContainer.axis = NSLayoutConstraint.Axis.vertical
        foodContainer.distribution = UIStackView.Distribution.fillEqually
        foodContainer.alignment = UIStackView.Alignment.leading
        foodContainer.spacing = 0.0
        
        let foodNameInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        foodNameInput.placeholder = " Enter food here..."
        foodNameInput.borderStyle = .line
        foodNameInput.font = .systemFont(ofSize: 18)
        foodNameInput.backgroundColor = UIColor(named: "BodyColour")
        foodNameInput.translatesAutoresizingMaskIntoConstraints = false
        foodContainer.addSubview(foodNameInput)
        
        let amountInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        amountInput.placeholder = " Amount eaten..."
        amountInput.borderStyle = .line
        amountInput.font = .systemFont(ofSize: 18)
        amountInput.translatesAutoresizingMaskIntoConstraints = false
        foodContainer.addSubview(amountInput)
        
        let notesInput = UITextField(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        notesInput.placeholder = " Any additional notes...."
        notesInput.borderStyle = .line
        notesInput.font = .systemFont(ofSize: 18)
        notesInput.translatesAutoresizingMaskIntoConstraints = false
        foodContainer.addSubview(notesInput)
        
        
//        NSLayoutConstraint.activate([
//        // place constraints in here separated by commas
//            // loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            // loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        
        
        // return food, add it into an array, edit things in the array, add everything in the array when you click add meal 
        return newFood
    }
    
}
