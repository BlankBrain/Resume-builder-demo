//
//  WorkVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class WorkVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    var workExp = CurrentResume.shared.experience
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    
    @IBAction func addWork(_ sender: Any) {
        
        let alert = UIAlertController(title: "Work Experience", message: "Input Your Work Experience", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = " Company name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " Duration"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField1 = alert?.textFields![0]
            let textField2 = alert?.textFields![1]
            
            
            var workExp1 = CurrentResume.workExp()
            workExp1.companyName = textField1?.text ?? "Apple"
            workExp1.Duration = textField2?.text ?? "10"
            
            if(workExp1.companyName.isBlank || workExp1.Duration.isBlank){
                utility.showAlart(self, title: "Error !", message: "Please enter your work experience properly")
            }else{
                self.workExp.append(workExp1)
                CurrentResume.shared.experience = self.workExp
            }
            
            
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        CurrentResume.shared.experience = workExp

        
        performSegue(withIdentifier: "workToEdu", sender: self)
    }
    
    
}
extension WorkVC:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workExp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? WorkSummaryTableViewCell)!
        cell.company.text = self.workExp[indexPath.row].companyName
        cell.duration.text =  self.workExp[indexPath.row].Duration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "delete"){ ( action, view, completionHandler ) in
            
            
            DispatchQueue.main.async {
                if  ( CurrentResume.shared.experience.contains(where: {$0.companyName == CurrentResume.shared.experience[indexPath.row].companyName})  )  {
                    self.workExp.remove(at: indexPath.row)
                    CurrentResume.shared.experience.remove(at: indexPath.row)
                } else {
                   //item could not be found
                }

                self.tableview.reloadData()
            }
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
}
