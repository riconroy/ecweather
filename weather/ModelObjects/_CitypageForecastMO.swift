// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CitypageForecastMO.swift instead.

import CoreData

enum CitypageForecastMOAttributes: String {
    case citypageID = "citypageID"
    case condition = "condition"
    case dewpoint = "dewpoint"
    case forecastTimeLocal = "forecastTimeLocal"
    case forecastTimeUTC = "forecastTimeUTC"
    case forecastTimeUser = "forecastTimeUser"
    case iconCode = "iconCode"
    case normalHigh = "normalHigh"
    case normalLow = "normalLow"
    case observeTimeLocal = "observeTimeLocal"
    case observeTimeUTC = "observeTimeUTC"
    case observeTimeUser = "observeTimeUser"
    case pressureChange = "pressureChange"
    case pressureCurrent = "pressureCurrent"
    case pressureTendency = "pressureTendency"
    case relativeHumidity = "relativeHumidity"
    case temperature = "temperature"
    case visibility = "visibility"
    case windDegrees = "windDegrees"
    case windDirection = "windDirection"
    case windSpeed = "windSpeed"
    case windchill = "windchill"
}

enum CitypageForecastMORelationships: String {
    case citypage = "citypage"
}

@objc
class _CitypageForecastMO: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "CitypageForecast"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _CitypageForecastMO.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var citypageID: String?

    // func validateCitypageID(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var condition: String?

    // func validateCondition(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var dewpoint: NSNumber?

    // func validateDewpoint(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var forecastTimeLocal: NSNumber?

    // func validateForecastTimeLocal(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var forecastTimeUTC: NSNumber?

    // func validateForecastTimeUTC(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var forecastTimeUser: NSNumber?

    // func validateForecastTimeUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var iconCode: NSNumber?

    // func validateIconCode(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var normalHigh: NSNumber?

    // func validateNormalHigh(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var normalLow: NSNumber?

    // func validateNormalLow(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var observeTimeLocal: NSNumber?

    // func validateObserveTimeLocal(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var observeTimeUTC: NSNumber?

    // func validateObserveTimeUTC(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var observeTimeUser: String?

    // func validateObserveTimeUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var pressureChange: NSNumber?

    // func validatePressureChange(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var pressureCurrent: NSNumber?

    // func validatePressureCurrent(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var pressureTendency: String?

    // func validatePressureTendency(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var relativeHumidity: NSNumber?

    // func validateRelativeHumidity(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var temperature: NSNumber?

    // func validateTemperature(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var visibility: NSNumber?

    // func validateVisibility(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var windDegrees: NSNumber?

    // func validateWindDegrees(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var windDirection: String?

    // func validateWindDirection(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var windSpeed: NSNumber?

    // func validateWindSpeed(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var windchill: NSNumber?

    // func validateWindchill(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var citypage: LocationMO?

    // func validateCitypage(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

