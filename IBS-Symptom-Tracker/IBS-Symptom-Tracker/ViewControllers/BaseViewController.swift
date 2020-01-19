//
//  BaseViewController.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class BaseViewController: UIViewController {

    @IBOutlet weak var addItemButton: UIBarButtonItem!
    var realm: Realm!
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Realm configuration
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
        
        // Check if I need a new day object on realm
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .none
        let today = dateFormat.string(from: Date())
        checkAddNewDate(date: today)
        
        navigationItem.title = today
        
        // add scroll view
        scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -90).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // add stack view to go inside the scroll view
        stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing   = 16.0
        scrollView.addSubview(stackView)
//        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true

        updateRealmResults()
    }

    @IBAction func addItemPressed(_ sender: Any) {
        performSegue(withIdentifier: "SegueToOptions", sender: self)
    }
    
    func checkAddNewDate(date: String) {
        let checkTodayInit = realm.objects(Day.self).filter("date = %@", date)
        if checkTodayInit.isEmpty {
            let newDayObject = Day()
            newDayObject.date = date
            try! realm.write {
                realm.add(newDayObject)
            }
        }
        dayObject = checkTodayInit[0]
    }
    
    func updateRealmResults () {
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        // add meals
        let mealResults = realm.objects(Meal.self).filter("day = %@", dayObject!)
        for meal in mealResults {
            createMealDisplay(meal: meal)
        }
        // add symptoms
        let symptomResults = realm.objects(Symptom.self).filter("day = %@", dayObject!)
        for symptom in symptomResults {
            createSymptomDisplay(symptom: symptom)
        }
        // add supplements
        let supplementResults = realm.objects(Supplement.self).filter("day = %@", dayObject!)
        for supplement in supplementResults {
            createSupplementDisplay(supplement: supplement)
        }
        // add bowel movements
        let BMResults = realm.objects(BowelMovement.self).filter("day = %@", dayObject!)
        for BM in BMResults {
            createBMDisplay(bm: BM)
        }
    }
    
    func createSymptomDisplay (symptom: Symptom) {
        let symptomStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 372.67, height: 90))
        symptomStackView.axis  = NSLayoutConstraint.Axis.vertical
        symptomStackView.distribution  = UIStackView.Distribution.fillProportionally
        symptomStackView.alignment = UIStackView.Alignment.fill
        symptomStackView.translatesAutoresizingMaskIntoConstraints = false
        symptomStackView.spacing = 0.0

        let symptomName = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        symptomName.translatesAutoresizingMaskIntoConstraints = false
        symptomName.font = .systemFont(ofSize: 18, weight: .semibold)
        symptomName.text = symptom.name
        symptomName.backgroundColor = UIColor(named: "BodyColour")
        symptomStackView.addArrangedSubview(symptomName)

        let symptomSeverity = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        symptomSeverity.translatesAutoresizingMaskIntoConstraints = false
        symptomSeverity.font = .systemFont(ofSize: 18)
        symptomSeverity.text = symptom.severity
        symptomStackView.addArrangedSubview(symptomSeverity)

        let symptomNotes = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        symptomNotes.translatesAutoresizingMaskIntoConstraints = false
        symptomNotes.font = .systemFont(ofSize: 18)
        symptomNotes.text = symptom.notes
        symptomStackView.addArrangedSubview(symptomNotes)
        
        stackView.addArrangedSubview(symptomStackView)
    }
    
    func createSupplementDisplay (supplement: Supplement) {
        let supplementStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 372.67, height: 90))
        supplementStackView.axis  = NSLayoutConstraint.Axis.vertical
        supplementStackView.distribution  = UIStackView.Distribution.fillProportionally
        supplementStackView.alignment = UIStackView.Alignment.fill
        supplementStackView.translatesAutoresizingMaskIntoConstraints = false
        supplementStackView.spacing = 0.0

        let supplementName = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        supplementName.translatesAutoresizingMaskIntoConstraints = false
        supplementName.font = .systemFont(ofSize: 18, weight: .semibold)
        supplementName.text = supplement.name
        supplementName.backgroundColor = UIColor(named: "BodyColour")
        supplementStackView.addArrangedSubview(supplementName)

        let supplementType = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        supplementType.translatesAutoresizingMaskIntoConstraints = false
        supplementType.font = .systemFont(ofSize: 18)
        supplementType.text = supplement.type
        supplementStackView.addArrangedSubview(supplementType)

        let supplementNotes = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        supplementNotes.translatesAutoresizingMaskIntoConstraints = false
        supplementNotes.font = .systemFont(ofSize: 18)
        supplementNotes.text = supplement.notes
        supplementStackView.addArrangedSubview(supplementNotes)
        
        stackView.addArrangedSubview(supplementStackView)
    }
    
    func createBMDisplay (bm: BowelMovement) {
        let bmStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 372.67, height: 60))
        bmStackView.axis  = NSLayoutConstraint.Axis.vertical
        bmStackView.distribution  = UIStackView.Distribution.fillProportionally
        bmStackView.alignment = UIStackView.Alignment.fill
        bmStackView.translatesAutoresizingMaskIntoConstraints = false
        bmStackView.spacing = 0.0
        
        let BMLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        BMLabel.translatesAutoresizingMaskIntoConstraints = false
        BMLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        BMLabel.text = "Bowel Movement"
        BMLabel.backgroundColor = UIColor(named: "BodyColour")
        bmStackView.addArrangedSubview(BMLabel)

        let bmNotes = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        bmNotes.translatesAutoresizingMaskIntoConstraints = false
        bmNotes.font = .systemFont(ofSize: 18)
        bmNotes.text = bm.notes
        bmStackView.addArrangedSubview(bmNotes)
        
        stackView.addArrangedSubview(bmStackView)
    }
    
    func createMealDisplay (meal: Meal) {
        let mealStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 372.67, height: 210))
        mealStackView.axis  = NSLayoutConstraint.Axis.vertical
        mealStackView.distribution  = UIStackView.Distribution.fillProportionally
        mealStackView.alignment = UIStackView.Alignment.fill
        mealStackView.translatesAutoresizingMaskIntoConstraints = false
        mealStackView.spacing = 0.0

        let mealName = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
        mealName.translatesAutoresizingMaskIntoConstraints = false
        mealName.font = .systemFont(ofSize: 18, weight: .semibold)
        mealName.text = meal.name
        mealName.backgroundColor = UIColor(named: "BodyColour")
        mealStackView.addArrangedSubview(mealName)
        
        let foodResults = realm.objects(Food.self).filter("meal = %@", meal)
        for food in foodResults {
            let foodName = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
            foodName.translatesAutoresizingMaskIntoConstraints = false
            foodName.font = .systemFont(ofSize: 18, weight: .semibold)
            foodName.text = food.name
            mealStackView.addArrangedSubview(foodName)
            
            let foodAmount = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
            foodAmount.translatesAutoresizingMaskIntoConstraints = false
            foodAmount.font = .systemFont(ofSize: 18)
            foodAmount.text = food.amount
            mealStackView.addArrangedSubview(foodAmount)
            
            let foodNotes = UILabel(frame: CGRect(x: 0, y: 0, width: 372.67, height: 30))
            foodNotes.translatesAutoresizingMaskIntoConstraints = false
            foodNotes.font = .systemFont(ofSize: 18)
            foodNotes.text = food.notes
            mealStackView.addArrangedSubview(foodNotes)
        }
        stackView.addArrangedSubview(mealStackView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateRealmResults()
    }
}
