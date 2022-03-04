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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableForSkill.delegate = self
        tableForSkill.dataSource = self
    }
    
    @IBAction func addSkill(_ sender: Any) {
        
        
        
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        
        performSegue(withIdentifier: "skilltoWork", sender: self)
    }
    

}
extension SkillVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath)
        cell.textLabel?.text = "good"
        return cell
    }
    
    
    
}
