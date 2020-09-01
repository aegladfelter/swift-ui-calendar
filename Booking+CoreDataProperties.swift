//
//  Booking+CoreDataProperties.swift
//  SwiftUI-KDCalendar
//
//  Created by Austin Gladfelter on 9/1/20.
//  Copyright © 2020 aegladfelter. All rights reserved.
//

import Foundation
import CoreData


extension Booking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booking> {
        return NSFetchRequest<Booking>(entityName: "Booking")
    }

    @NSManaged public var bookingid: Int32
    @NSManaged public var category: String?
    @NSManaged public var cost: Float
    @NSManaged public var enddate: Date?
    @NSManaged public var guests: Int32
    @NSManaged public var id: Int32
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var startdate: Date?
    @NSManaged public var wineryid: Int32

}
