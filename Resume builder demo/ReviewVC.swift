//
//  ReviewVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit
import CoreData

class ReviewVC: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var lblPicture: UILabel!
    @IBOutlet weak var carreerobjective: UITextView!
    @IBOutlet weak var EduSummary: UITextView!
    @IBOutlet weak var skills: UITextView!
    @IBOutlet weak var TotalYearOfExp: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var MobileNumber: UILabel!
    @IBOutlet weak var txtaddress: UITextView!
    @IBOutlet weak var objective: UITextView!
    @IBOutlet weak var workExp: UITextView!
    @IBOutlet weak var ProjectSummary: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        setupReview()
    }
    func setupReview(){
        picture.image = CurrentResume.shared.image
        let name = ( CurrentResume.shared.firstName + " " + CurrentResume.shared.middleNAme + " " + CurrentResume.shared.lastName)
        lblName.text = name
        lblemail.text =  ( "Email :" + CurrentResume.shared.email )
        MobileNumber.text =  ( "Phone :" + CurrentResume.shared.phone )
         carreerobjective.text = ( "Career Objective : " + CurrentResume.shared.objective)
        TotalYearOfExp.text = ("Total Year in experience: " + CurrentResume.shared.totalYear )
        txtaddress.text =  ( "Address : " + CurrentResume.shared.address )
        objective.text =  ( "Career Objective :" + CurrentResume.shared.objective )
        
        //work
        var work = """
        Work Summary :
        """
        for item in CurrentResume.shared.experience {
            work = work + """

              Compsny name: \(item.companyName)
              Duration: \(item.Duration)
"""
        }
        workExp.text = work
        //skills
        var skill = "Skills: "
        for items in CurrentResume.shared.skills {
            skill = ( skill + ", "  + items )
        }
        skills.text = skill
        //edu
        var edu = """
        Education Details:
        """
        for item in CurrentResume.shared.Education {
            edu = edu + """

              Class name: \(item.className)
              Passing Year: \(item.passingYear)
              Gpa: \(item.GPA)
"""  }
        EduSummary.text = edu
        //project
        var projects = """
        Project Details:
        """
        for item in CurrentResume.shared.projects {
            projects = projects + """

              Project name: \(item.projectName)
              project Summary: \(item.Summary)
              Role: \(item.role)
              Technology Used: \(item.tech)
              Team Size: \(item.TeamSize)

""" }
        ProjectSummary.text = projects

}
}
