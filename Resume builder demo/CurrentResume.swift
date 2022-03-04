//
//  CurrentResume.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import Foundation


public class CurrentResume {
    
    let isConsolePrint = true

    
    static let shared = CurrentResume()
    
    var firstName:String = ""
    var middleNAme:String = ""
    var lastName:String = ""
    var phone:String = ""
    var email:String = ""
    var address:String = ""
    var objective:String = ""
    var totalYear: Int = 0
    var skills = [String]()
    var experience = [workExp]()
    var Education = [Edu]()

    struct workExp{
        var companyName:String = ""
        var Duration:String = ""
    }
    
    struct Edu {
        var className: String = ""
        var passingYear : String = ""
        var GPA:String = ""
        
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
