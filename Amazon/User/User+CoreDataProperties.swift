//
//  User+CoreDataProperties.swift
//  Amazon
//
//  Created by Victoria Samsonova on 30.05.24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var address: String?
    @NSManaged public var birthday: Date?
    @NSManaged public var email: String?
    @NSManaged public var id: Int16
    @NSManaged public var password: String?
    @NSManaged public var status: Int16
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
