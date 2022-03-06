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
    var allResume = [CurrentResume()]
    

    // MARK: TableView Vars
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
       // let ResumeList = NSEntityDescription.entity(forEntityName: "Resume", in : context)!

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
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Resume> = Resume.fetchRequest()

        // Perform Fetch Request
        context.perform {
            do {
                // Execute Fetch Request
                let result = try fetchRequest.execute()
                print("\(result.count) ")

                    
                   

            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    
    
    
}
extension ViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allResume.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? ResumeTableViewCell)!
        let cv = self.allResume[indexPath.row]
//
        cell.Name.text = cv.firstName
        cell.MobileNumber.text = cv.phone
        cell.Email.text = cv.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    
    
}

