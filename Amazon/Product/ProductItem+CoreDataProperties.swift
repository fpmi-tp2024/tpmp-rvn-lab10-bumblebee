//
//  ProductItem+CoreDataProperties.swift
//  Amazon
//
//  Created by Victoria Samsonova on 29.05.24.
//
//

import Foundation
import CoreData


extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var prodDescription: String?
    @NSManaged public var amount: Int16

}

extension ProductItem : Identifiable {

}
