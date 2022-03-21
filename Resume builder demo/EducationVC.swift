//
//  EducationVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class EducationVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    var eduHistory = CurrentResume.shared.Education
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    
    
    @IBAction func addEducation(_ sender: Any) {
        
        let alert = UIAlertController(title: "Education", message: "Input Your Education History", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "class Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " passing Year"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " Gpa"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField1 = alert?.textFields![0]
            let textField2 = alert?.textFields![1]
            let textField3 = alert?.textFields![2]
            
            
            var edu = CurrentResume.Edu()
            edu.eduClass = textField1?.text ?? "Apple"
            edu.passingYear = textField2?.text ?? "2018"
            edu.gpa = textField3?.text ?? "4"
            
            self.eduHistory.append(edu)
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        print(CurrentResume.shared.Education)
        print(CurrentResume.shared.experience)
        print(CurrentResume.shared.skills)
        CurrentResume.shared.Education = self.eduHistory
        performSegue(withIdentifier: "eduToProject", sender: self)
        
    }
    
    
    
}
extension EducationVC:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eduHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? EducationTableViewCell)!
        cell.className.text = self.eduHistory[indexPath.row].eduClass
        cell.passingYear.text = self.eduHistory[indexPath.row].passingYear
        cell.Gpa.text = self.eduHistory[indexPath.row].gpa
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "delete"){ ( action, view, completionHandler ) in
            
            DispatchQueue.main.async {
                if  ( CurrentResume.shared.Education.contains(where: {$0.gpa == CurrentResume.shared.Education[indexPath.row].gpa}) )  {
                    self.eduHistory.remove(at: indexPath.row)
                    CurrentResume.shared.Education.remove(at: indexPath.row)
                } else {
                   //item could not be found
                }
                
                
                self.tableview.reloadData()
            }
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
}
