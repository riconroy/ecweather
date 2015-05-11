// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LocationMO.swift instead.

import CoreData

enum LocationMOAttributes: String {
    case citypageID = "citypageID"
    case citypageName = "citypageName"
    case meteoFilename = "meteoFilename"
    case meteoID = "meteoID"
    case province = "province"
    case regionCode = "regionCode"
}

enum LocationMORelationships: String {
    case citypage = "citypage"
}

@objc
class _LocationMO: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Location"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _LocationMO.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var citypageID: String?

    // func validateCitypageID(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var citypageName: String?

    // func validateCitypageName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var meteoFilename: String?

    // func validateMeteoFilename(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var meteoID: String?

    // func validateMeteoID(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var province: String?

    // func validateProvince(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var regionCode: String?

    // func validateRegionCode(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var citypage: CitypageForecastMO?

    // func validateCitypage(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

