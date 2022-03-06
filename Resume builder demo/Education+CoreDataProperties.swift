//
//  Education+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 6/3/22.
//
//

import Foundation
import CoreData


extension Education {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Education> {
        return NSFetchRequest<Education>(entityName: "Education")
    }

    @NSManaged public var eduClass: String?
    @NSManaged public var gpa: String?
    @NSManaged public var passingYear: String?
    @NSManaged public var eduExp: Resume?

}
