//
//  ReviewVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit
import CoreData
import SimplePDF

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
    
    //MARK: CoreDate
    var allResume: [NSManagedObject] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var projects = """
    Project Details:
    """
    var work = """
    Work Summary :
    """
    var edu = """
    Education Details:
    """
    var skill = "Skills: "
    let name = ( CurrentResume.shared.firstName + " " + CurrentResume.shared.middleNAme + " " + CurrentResume.shared.lastName)
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
       
        lblName.text = name
        lblemail.text =  ( "Email :" + CurrentResume.shared.email )
        MobileNumber.text =  ( "Phone :" + CurrentResume.shared.phone )
         carreerobjective.text = ( "Career Objective : " + CurrentResume.shared.objective)
        TotalYearOfExp.text = ("Total Year in experience: " + CurrentResume.shared.totalYear )
        txtaddress.text =  ( "Address : " + CurrentResume.shared.address )
        objective.text =  ( "Career Objective :" + CurrentResume.shared.objective )
        
        //work
   
        for item in CurrentResume.shared.experience {
            work = work + """

              Compsny name: \(item.companyName)
              Duration: \(item.Duration)
"""
        }
        workExp.text = work
        //skills
        for items in CurrentResume.shared.skills {
            skill = ( skill + ", "  + items )
        }
        skills.text = skill
        //edu

        for item in CurrentResume.shared.Education {
            edu = edu + """

              Class name: \(item.eduClass)
              Passing Year: \(item.passingYear)
              Gpa: \(item.gpa)
"""  }
        EduSummary.text = edu
        //project
       
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
    
    
    @IBAction func saveResume(_ sender: Any) {
        
        
        saveResume()
        
    }
    
    
    @IBAction func exportPDF(_ sender: Any) {
        createPDF()
        
    }

    func createPDF(){
        let a4PaperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: a4PaperSize)
        pdf.setContentAlignment(.center)

        // add logo image
        let logoImage = CurrentResume.shared.image
        pdf.addImage(logoImage)
        pdf.addLineSpace(30)
        pdf.setContentAlignment(.left)
        pdf.addText("Name: \(name)")
        
        pdf.addLineSeparator()
        pdf.addLineSpace(20.0)
        pdf.setContentAlignment(.left)
        pdf.addText("Address : \(CurrentResume.shared.address)")
        
        pdf.addLineSeparator()

        pdf.setContentAlignment(.left)
        pdf.addText("Mobile Number: \(CurrentResume.shared.phone)")
 
        pdf.setContentAlignment(.right)
        pdf.addText("Email : \(CurrentResume.shared.email)")
        
        pdf.addLineSeparator()
        pdf.addLineSpace(20.0)
        pdf.setContentAlignment(.left)
        pdf.addText(" Total Year of Experience : \(CurrentResume.shared.totalYear)")
        
        pdf.addLineSeparator()
        pdf.addLineSpace(20.0)
        pdf.setContentAlignment(.left)
        pdf.addText("Career Objective: \(CurrentResume.shared.objective)")
        
        pdf.beginNewPage()
        pdf.addLineSpace(20.0)
        pdf.addText("  \(skill)")
        pdf.addLineSpace(30)
        pdf.setContentAlignment(.left)
        
        pdf.addLineSpace(20.0)
        pdf.addText("  \(work)")
        pdf.addLineSpace(30)
        pdf.setContentAlignment(.left)
        
        pdf.addLineSpace(20.0)
        pdf.addText("  \(projects)")
        pdf.addLineSpace(30)
        pdf.setContentAlignment(.left)
        
        pdf.addLineSpace(20.0)
        pdf.addText("  \(edu)")
        pdf.addLineSpace(30)
        pdf.setContentAlignment(.left)
        
        

       

       // pdf.beginNewPage()
       // pdf.addText("Begin new page")
        // Generate PDF data and save to a local file.
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
        
            let pdfData = pdf.generatePDFdata()
            do{
               // try pdfData.write(to: path )// writeToFile(documentsFileName, options: .DataWritingAtomic)
                guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Resume").appendingPathExtension("pdf")
                        else { fatalError("Destination URL not created") }
                    
                    try pdfData.write(to: outputURL)
                    print("open \(outputURL.path)")
                utility.showAlart(self, title: "Success !", message: " Your Resume is can be found at \(outputURL.path)")
                
                
                
            }catch{
                print(error)
            }
        }
        
    }
    
    func saveResume() {
        
//        let newResume = Resume(context: self.context)
//        print(CurrentResume.shared)
//        newResume.firstName = CurrentResume.shared.firstName
//        newResume.middleName = CurrentResume.shared.middleNAme
//        newResume.lastName = CurrentResume.shared.lastName
//        newResume.mobileNumber = CurrentResume.shared.phone
//        newResume.email = CurrentResume.shared.email
//        newResume.cvAddress = CurrentResume.shared.address
//        newResume.carreerObjective = CurrentResume.shared.objective
//        newResume.totalYearofExp = CurrentResume.shared.totalYear
//        newResume.skills = CurrentResume.shared.skills
        
        //MARK:- Needs to work further
//        newResume.addToEducation(NSSet(array: CurrentResume.shared.experience))
//        newResume.addToEducation(NSSet(array: CurrentResume.shared.Education))
//        newResume.addToProjectExp(NSSet(array: CurrentResume.shared.projects))
        
        
        
        let ResumeEntity = NSEntityDescription.entity(forEntityName: "Resume", in: self.context)
        let resume = Resume(entity: ResumeEntity!, insertInto: self.context)
        resume.firstName = CurrentResume.shared.firstName
        resume.middleName = CurrentResume.shared.middleNAme
        resume.lastName = CurrentResume.shared.lastName
        resume.mobileNumber = CurrentResume.shared.phone
        resume.email = CurrentResume.shared.email
        resume.cvAddress = CurrentResume.shared.address
        resume.carreerObjective = CurrentResume.shared.objective
        resume.totalYearofExp = CurrentResume.shared.totalYear
        resume.skills = CurrentResume.shared.skills


        let WorkEntity = NSEntityDescription.entity(forEntityName: "Work", in: self.context)
        let work = Work(entity: WorkEntity!, insertInto: self.context)
        var Exp = [Work]()
        for item in CurrentResume.shared.experience{
            work.companyName = item.companyName
            work.duration = item.Duration
            Exp.append( work)
        }
         
        let eduEntity = NSEntityDescription.entity(forEntityName: "Education", in: self.context)
        let Edu = Education(entity: eduEntity!, insertInto: self.context)
        var eduExp = [Education]()
        for item in CurrentResume.shared.Education{
            Edu.passingYear = item.passingYear
            Edu.gpa = item.gpa
            Edu.eduClass = item.eduClass
            eduExp.append( Edu)
        }
        
        let projectEntity = NSEntityDescription.entity(forEntityName: "Project", in: self.context)
        let project = Project(entity: projectEntity!, insertInto: self.context)
        var ProjectExp = [Project]()
        for item in CurrentResume.shared.projects{
            project.projectNAme = item.projectName
            project.tech = item.tech
            project.role = item.role
            project.teamSize = item.TeamSize
            project.summary = item.Summary
            ProjectExp.append( project)
        }
        
        let data = CurrentResume.shared.image.jpegData(compressionQuality: 0.9)
        resume.profileImage =  data

        
        resume.workExp = NSSet(array: Exp)
        resume.education = NSSet(array: eduExp)
        resume.projectExp = NSSet(array: ProjectExp)

        

        
        
        
        //Save data
        do{
            try utility.context.save()
            print("Data Saved")
            utility.showAlart(self, title: "Success", message: "your Resume saved successfully !")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }catch{
            print("Error while saving resume")
        }
        
    }
    
    
    
}
