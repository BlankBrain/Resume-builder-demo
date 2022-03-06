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
    //var ResumeList = [Resume.init()]

    // MARK: TableView Vars
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
       // let ResumeList = NSEntityDescription.entity(forEntityName: "Resume", in : context)!
//        guard let path = Bundle.main.url(forResource: "test", withExtension: "pdf") else {
//            return
//        }
        
        
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
    
    func fetchResume(){
        do{
           // self.ResumeList =  try context.fetch(Resume.fetchRequest())

            DispatchQueue.main.async {
                self.tableview.reloadData()
            }

        }catch{

        }

    }
    
    
    
    
    
}
extension ViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.ResumeList.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? ResumeTableViewCell)!
//        let cv = self.ResumeList[indexPath.row]
//        let name1 =  cv.firstName
//        let name2 =  cv.middleName
//        let name3 =  cv.lastName
//        let name = ( name1! + " " + name2! + " " + name3! )
        cell.Name.text = "twst"//name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    
    
}


