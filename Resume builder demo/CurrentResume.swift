//
//  CurrentResume.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import Foundation
import UIKit


public class CurrentResume {
    let isConsolePrint = true
    static let shared = CurrentResume()
    
    var isEditMode:Bool = false
    var Index = 0 
    var image = UIImage() 
    var firstName:String = ""
    var middleNAme:String = ""
    var lastName:String = ""
    var phone:String = ""
    var email:String = ""
    var address:String = ""
    var objective:String = ""
    var totalYear: String = ""
    var skills = [String]()
    var experience = [workExp]()
    var Education = [Edu]()
    var projects = [project]()
    struct workExp{
        var companyName:String = ""
        var Duration:String = ""
    }
    
    struct Edu {
        var eduClass: String = ""
        var gpa:String = ""
        var passingYear : String = ""
        
    }
    struct project {
        var projectName: String = ""
        var TeamSize : String = ""
        var Summary:String = ""
        var tech:String = ""
        var role:String = ""
    }
    
    public func printE(_ items: Any..., separator: String = "", terminator: String = "") {
        if isConsolePrint {
            debugPrint(items)
        }
    }
    deinit {
        printE("\(self) \(#function)")
    }
}
