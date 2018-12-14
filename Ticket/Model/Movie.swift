//
//  Movie.swift
//  Ticket
//
//  Created by AruniOS on 14/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Movie:Object {
    @objc dynamic var movieNameRealm : String?
    @objc dynamic var movieImgRealm : String?
    @objc dynamic var movieRatingRealm = 0
    
    override static func primaryKey() -> String{
        return "movieNameRealm"
    }
}
