//
//  BowelMovement.swift
//  IBS-Symptom-Tracker
//
//  Created by Anne Wang on 2020-01-18.
//  Copyright © 2020 Anne Wang. All rights reserved.
//

import Foundation
import RealmSwift

class BowelMovement: Object{
    @objc dynamic var notes = ""
    @objc dynamic var day: Day!
}
