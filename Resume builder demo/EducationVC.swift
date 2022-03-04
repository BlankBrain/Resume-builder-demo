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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
    }
    

    
    
    
    
    

}
extension EducationVC:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as? EducationTableViewCell)!
        cell.className.text = "Class: iOS "
        cell.passingYear.text = "Passing Year: 2019"
        cell.Gpa.text = "GPA: 3.0 "
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)

       }
    
    
}
