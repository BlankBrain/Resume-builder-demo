//
//  Project+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 21/3/22.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var projectNAme: String?
    @NSManaged public var role: String?
    @NSManaged public var summary: String?
    @NSManaged public var teamSize: String?
    @NSManaged public var tech: String?
    @NSManaged public var projectexp: Resume?

}
