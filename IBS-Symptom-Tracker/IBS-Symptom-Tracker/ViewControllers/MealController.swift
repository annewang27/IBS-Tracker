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
    
    var foodObjects: [FoodContainer] = []
    var index = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing   = 16.0
        
        AddButton.layer.borderColor = UIColor.black.cgColor
        AddButton.layer.borderWidth = 1
        AddButton.layer.cornerRadius = 5
        
        stackView.addArrangedSubview(MealNameLabel)
        stackView.addArrangedSubview(MealNameInput)
        let container1 = FoodContainer()
        foodObjects.append(container1)
        let container2 = FoodContainer()
        foodObjects.append(container2)
        stackView.addArrangedSubview(container1)
        stackView.addArrangedSubview(container2)
        stackView.addArrangedSubview(AddFood)
        stackView.addArrangedSubview(AddButton)
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // add in meal name, option to add more food, final add button on storyboard
        // create programatic version of add food controller
        // pass in meal to all food
        

        
        
    }
    
    @IBAction func onClickAddMeal(_ sender: Any) {
        let realm = try! Realm()
        let newMeal = Meal()
                
        try! realm.write {
            newMeal.name = MealNameInput.text!
            newMeal.day = dayObject
            
            realm.add(newMeal)
        }
        
        try! realm.write {
            for i in 0...index-2 {
                let newFood = Food()
                newFood.meal = newMeal
                newFood.name = foodObjects[i].foodNameInput.text!
                newFood.amount = foodObjects[i].amountInput.text!
                newFood.notes = foodObjects[i].notesInput.text!
                
                realm.add(newFood)
            }
        }
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickAddFood(_ sender: Any) {
        index = index + 1
        let newFoodContainer = FoodContainer()
        foodObjects.append(newFoodContainer)
        stackView.insertArrangedSubview(newFoodContainer, at: index)
    }
}
