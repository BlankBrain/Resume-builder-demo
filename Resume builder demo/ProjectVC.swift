//
//  ProjectVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit

class ProjectVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    
    var projects = CurrentResume.shared.projects
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    

    @IBAction func addProject(_ sender: Any) {
        
        let alert = UIAlertController(title: " Project Details", message: "Input Your Project Details", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Project name :"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " Team Size:"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " P{roject Summary"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " Technology Used"
        }
        alert.addTextField { (textField) in
            textField.placeholder = " Role"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField1 = alert?.textFields![0]
            let textField2 = alert?.textFields![1]
            let textField3 = alert?.textFields![2]
            let textField4 = alert?.textFields![3]
            let textField5 = alert?.textFields![4]

            
            var project1 = CurrentResume.project()
            project1.projectName = textField1?.text ?? ""
            project1.TeamSize = textField2?.text ?? ""
            project1.Summary = textField3?.text ?? ""
            project1.tech = textField4?.text ?? ""
            project1.role = textField5?.text ?? ""

            
            self.projects.append(project1)
            CurrentResume.shared.projects = self.projects
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
  

}
extension ProjectVC:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? ProjectTableViewCell)!
        cell.projectname.text =  ("Project Name: " +   self.projects[indexPath.row].projectName )
        cell.teamSize.text = ("team Size : " + self.projects[indexPath.row].TeamSize )
        cell.projectSummary.text = ("Project Summary : " + self.projects[indexPath.row].Summary )
        cell.Tech.text = ("Technology used : " + self.projects[indexPath.row].tech)
        cell.Role.text = ("Role : " + self.projects[indexPath.row].role)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
    }
    
    
}
