//
//  Dog.swift
//  dogDataRealm
//
//  Created by ROHIT GUPTA on 2/10/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import Foundation
import RealmSwift

// Dog model
class Dog: Object {
    dynamic var name = ""
    dynamic var age = 0
}