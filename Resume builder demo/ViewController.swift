//
//  ViewController.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 3/3/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addResume: UIButton!
    
    //MARK: coredata
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var allResume = [Resume]()
    
    
    // MARK: TableView Vars
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        fetchResume()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
    }
    
    
    // Button Action
    @IBAction func addBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "homeToPersonal", sender: self)
        
    }
    
    
    
    func fetchResume() {
        let fetchRequest: NSFetchRequest<Resume> = Resume.fetchRequest()
        context.perform {
            do {
                let result = try fetchRequest.execute()
                print("\(result.count) ")
                //print("\(String(describing: result[2].firstName)) ")
                if( result.count > 0){
                    for items in result {
                        self.allResume.append(items)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }
                
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    
    
    
}
extension ViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allResume.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? ResumeTableViewCell)!
        let cv = self.allResume[indexPath.row]
        cell.Name.text = cv.firstName 
        cell.MobileNumber.text = cv.mobileNumber
        cell.Email.text = cv.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
       let cv =  self.allResume[indexPath.row]
        CurrentResume.shared.firstName = cv.firstName ?? ""
        CurrentResume.shared.middleNAme = cv.middleName ?? ""
        CurrentResume.shared.lastName = cv.lastName ?? ""
        CurrentResume.shared.phone = cv.mobileNumber ?? ""
        CurrentResume.shared.skills = cv.skills ?? [""]
        CurrentResume.shared.totalYear = cv.totalYearofExp ?? ""
        CurrentResume.shared.address = cv.cvAddress ?? ""
        CurrentResume.shared.experience =  cv.workExp?.allObjects as? [CurrentResume.workExp] ?? []
        CurrentResume.shared.Education = cv.education?.allObjects as? [CurrentResume.Edu] ?? []
        CurrentResume.shared.projects = cv.projectExp?.allObjects as? [CurrentResume.project] ?? []
        CurrentResume.shared.image = cv.profileImage as? UIImage ?? UIImage(systemName: "face.smiling") as! UIImage
        CurrentResume.shared.isEditMode = true
        print(CurrentResume.shared.skills)
        if( CurrentResume.shared.isEditMode == true){
            performSegue(withIdentifier: "homeToPersonal", sender: self)

        }
        
        
    }
    
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .destructive, title: "delete"){ ( action, view, completionHandler ) in
//            
//            self.allResume.remove(at: indexPath.row)
//            DispatchQueue.main.async {
//                self.tableview.reloadData()
//            }
//            
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
    
}
extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map({ $0 as! T})
    return array
  }
}
