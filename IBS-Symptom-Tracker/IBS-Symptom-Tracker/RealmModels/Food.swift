//
//  Food.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import RealmSwift

class Food: Object {
    @objc dynamic var name = ""
    @objc dynamic var amount = ""
    @objc dynamic var tracking = false
    @objc dynamic var notes = ""
    @objc dynamic var meal: Meal!
}
