//
//  Contact+CoreDataProperties.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 22/11/2021.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var age: Int64
    @NSManaged public var city: String?
    @NSManaged public var date: String?
    @NSManaged public var email: String?
    @NSManaged public var first: String?
    @NSManaged public var id: String?
    @NSManaged public var large: String?
    @NSManaged public var last: String?
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var medium: String?
    @NSManaged public var phone: String?
    @NSManaged public var thumbnail: String?

}

extension Contact : Identifiable {

}
