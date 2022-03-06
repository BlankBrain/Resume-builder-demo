//
//  Resume+CoreDataProperties.swift
//  
//
//  Created by Md. Mehedi Hasan on 6/3/22.
//
//

import Foundation
import CoreData


extension Resume {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Resume> {
        return NSFetchRequest<Resume>(entityName: "Resume")
    }

    @NSManaged public var carreerObjective: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var middleName: String?
    @NSManaged public var mobileNumber: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var skills: [String]?
    @NSManaged public var totalYearofExp: String?
    @NSManaged public var cvAddress: String?
    @NSManaged public var education: NSSet?
    @NSManaged public var projectExp: NSSet?
    @NSManaged public var workExp: NSSet?

}

// MARK: Generated accessors for education
extension Resume {

    @objc(addEducationObject:)
    @NSManaged public func addToEducation(_ value: Education)

    @objc(removeEducationObject:)
    @NSManaged public func removeFromEducation(_ value: Education)

    @objc(addEducation:)
    @NSManaged public func addToEducation(_ values: NSSet)

    @objc(removeEducation:)
    @NSManaged public func removeFromEducation(_ values: NSSet)

}

// MARK: Generated accessors for projectExp
extension Resume {

    @objc(addProjectExpObject:)
    @NSManaged public func addToProjectExp(_ value: Project)

    @objc(removeProjectExpObject:)
    @NSManaged public func removeFromProjectExp(_ value: Project)

    @objc(addProjectExp:)
    @NSManaged public func addToProjectExp(_ values: NSSet)

    @objc(removeProjectExp:)
    @NSManaged public func removeFromProjectExp(_ values: NSSet)

}

// MARK: Generated accessors for workExp
extension Resume {

    @objc(addWorkExpObject:)
    @NSManaged public func addToWorkExp(_ value: Work)

    @objc(removeWorkExpObject:)
    @NSManaged public func removeFromWorkExp(_ value: Work)

    @objc(addWorkExp:)
    @NSManaged public func addToWorkExp(_ values: NSSet)

    @objc(removeWorkExp:)
    @NSManaged public func removeFromWorkExp(_ values: NSSet)

}
