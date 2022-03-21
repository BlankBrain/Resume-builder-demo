//
//  Work+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 21/3/22.
//
//

import Foundation
import CoreData


extension Work {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Work> {
        return NSFetchRequest<Work>(entityName: "Work")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var duration: String?
    @NSManaged public var exp: Resume?

}
