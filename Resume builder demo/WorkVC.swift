//
//  WorkVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class WorkVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextBtnPressed(_ sender: Any) {
        
        
        performSegue(withIdentifier: "workToEdu", sender: self)
    }
    

}
