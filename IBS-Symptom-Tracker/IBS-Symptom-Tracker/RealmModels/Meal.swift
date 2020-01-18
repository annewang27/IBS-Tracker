//
//  Meal.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import RealmSwift

class Meal: Object{
    @objc dynamic var name = ""
    @objc dynamic var day: Day!
}
