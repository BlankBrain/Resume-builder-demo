//
//  SkillAndWorkVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class SkillVC: UIViewController {
    
    @IBOutlet weak var tableForSkill: UITableView!
    
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    var skills = CurrentResume.shared.skills
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableForSkill.delegate = self
        tableForSkill.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    
    
    @IBAction func addSkill(_ sender: Any) {
        let alert = UIAlertController(title: "Add Skill", message: "Input Your Skill", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = " SKILL"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            
            print("Text field: \(textField?.text)")
            
            self.skills.append( textField?.text ?? "default Skill" )
            DispatchQueue.main.async {
                self.tableForSkill.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        CurrentResume.shared.skills = skills
        
        performSegue(withIdentifier: "skilltoWork", sender: self)
    }
    
    
}
extension SkillVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath)
        cell.textLabel?.text = self.skills[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .destructive, title: "delete"){ ( action, view, completionHandler ) in
//            
//            self.skills.remove(at: indexPath.row)
//            DispatchQueue.main.async {
//                self.tableForSkill.reloadData()
//            }
//            
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
    
    
}
