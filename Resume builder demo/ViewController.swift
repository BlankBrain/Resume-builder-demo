//
//  ViewController.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 3/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addResume: UIButton!
    
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    
    // MARK: TableView Vars

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self    }
    
    
    // Button Action
    @IBAction func addBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "homeToPersonal", sender: self)
        
    }
    
    
    
    
    


}
extension ViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)

       }
    
    
}


