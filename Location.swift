//
//  Location.swift
//  weather
//
//  Created by rick conroy on 2015-04-30.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var citypageID: String
    @NSManaged var citypageName: String
    @NSManaged var meteoFilename: String
    @NSManaged var meteoID: String
    @NSManaged var province: String
    @NSManaged var regionCode: String
    @NSManaged var citypage: NSManagedObject

}
