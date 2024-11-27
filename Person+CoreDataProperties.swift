//
//  Person+CoreDataProperties.swift
//  CoreDataExampleApp
//
//  Created by mac on 18/02/2024.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var address: String?

}

extension Person : Identifiable {

}
