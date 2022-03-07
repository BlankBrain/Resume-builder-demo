//
//  PersonalInfoVc.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit
import SimplePDF


class PersonalInfoVc: UIViewController {
    
    @IBOutlet weak var middleNAme: UILabel!
    @IBOutlet weak var lastNAme: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var Mname: UITextField!
    @IBOutlet weak var Lname: UITextField!
    
    @IBOutlet weak var middlename: UITextField!
    @IBOutlet weak var areaName: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var expInYears: UITextField!
    @IBOutlet weak var Country: UITextField!
    @IBOutlet weak var careerobjective: UITextView!
    @IBOutlet weak var txrtemail: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ( CurrentResume.shared.isEditMode == true ){
            UIinit()
            SetupValue()
        }else{
            UIinit()
        }
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
        careerobjective.layer.borderWidth = 2
        careerobjective.layer.borderColor = UIColor.gray.cgColor
        careerobjective.layer.cornerRadius = 5.0
        txtPhone.setUnderLine()
        Country.setUnderLine()
        expInYears.setUnderLine()
        zipCode.setUnderLine()
        areaName.setUnderLine()
        Lname.setUnderLine()
        Mname.setUnderLine()
        firstName.setUnderLine()
        middlename.setUnderLine()
        txrtemail.setUnderLine()
        streetName.setUnderLine()
        
        
    }
    func SetupValue(){
        txtPhone.text = CurrentResume.shared.phone
        firstName.text = CurrentResume.shared.firstName
        middlename.text = CurrentResume.shared.middleNAme
        lastNAme.text = CurrentResume.shared.lastName
        txrtemail.text = CurrentResume.shared.email
        expInYears.text = CurrentResume.shared.totalYear
        let address = CurrentResume.shared.address.components(separatedBy: " ")
        print(address)
        streetName.text = address[0]
        areaName.text = address[1]
        zipCode.text = address[2]
        Country.text = address[3]
        careerobjective.text = CurrentResume.shared.objective
        
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        
        CurrentResume.shared.firstName = firstName.text ?? ""
        CurrentResume.shared.middleNAme = Mname.text ?? ""
        CurrentResume.shared.lastName = Lname.text ?? ""
        let address1  = (( streetName.text ?? "") + " " +  (areaName.text ?? "" ) )
        let address2  =   ( " " + (zipCode.text ?? "" ) + (" " + Country.text! ))
        CurrentResume.shared.address = address1 + address2
        CurrentResume.shared.totalYear = expInYears.text ?? ""
        CurrentResume.shared.phone =  txtPhone.text ?? ""
        CurrentResume.shared.email = txrtemail.text ?? ""
        CurrentResume.shared.objective = careerobjective.text ?? ""
        performSegue(withIdentifier: "personalInfoToProfessional", sender: self)
        
        
        
        
        
        
    }
    
    
    
    
    
    
}




