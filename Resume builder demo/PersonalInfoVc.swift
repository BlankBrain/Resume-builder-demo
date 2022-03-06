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
        UIinit()
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
    
    func createPDF(){
        let a4PaperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: a4PaperSize)
        
        pdf.setContentAlignment(.center)
        
        // add logo image
        let logoImage = UIImage(named:"simple_pdf_logo")!
        pdf.addImage(logoImage)
        
        pdf.addLineSpace(30)
        
        pdf.setContentAlignment(.left)
        pdf.addText("Normal text follows by line separator")
        pdf.addLineSeparator()
        
        pdf.addLineSpace(20.0)
        
        pdf.setContentAlignment(.right)
        pdf.addText("Text after set content alignment to .Right")
        pdf.addLineSpace(20.0)
        
        pdf.addText("Cras quis eros orci.\nLorem ipsum dolor sit amet, consectetur adipiscing elit.\nDonec mollis vitae mi ut lobortis.\nUt ultrices mi vel neque venenatis, ut efficitur metus eleifend. Sed pellentesque lobortis est quis maximus. Maecenas ultricies risus et enim consectetur, id lobortis ante porta. Quisque at euismod enim. Vestibulum faucibus purus non justo fringilla, sit amet iaculis ex pellentesque. Vestibulum eget vulputate diam, sit amet ornare sem. Duis at eros non tortor malesuada accumsan.\nNunc vel libero ut sapien dictum iaculis a vel odio. Quisque purus turpis, tristique auctor ex non, consectetur scelerisque lorem. Mauris est justo, sollicitudin sit amet nisi a, mattis posuere orci. Sed elementum est at est tristique gravida. Aliquam iaculis, metus facilisis varius viverra, nunc libero ultricies arcu, in accumsan sem nibh vel purus.")
        
        pdf.addLineSpace(30)
        
        pdf.setContentAlignment(.center)
        
        pdf.addText("Center Text")
        pdf.addLineSpace(20.0)
        pdf.addText("Cras varius leo ac lectus malesuada, ut rhoncus nunc blandit.\n In venenatis diam et vehicula suscipit.\n Aliquam in ante at dolor sodales consectetur ut semper quam.\n Vivamus massa purus, congue sed leo sed, lobortis consectetur lacus. Nunc sed tortor nec augue mattis faucibus. Sed malesuada metus in sapien efficitur, ut aliquet nisl lobortis. Vestibulum faucibus purus non justo fringilla, sit amet iaculis ex pellentesque. Vestibulum eget vulputate diam, sit amet ornare sem. Aliquam erat volutpat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin scelerisque posuere mi, non consequat mauris auctor a. Fusce lacinia auctor lectus a elementum.")
        
        
        pdf.addLineSpace(30.0)
        
        pdf.setContentAlignment(.left)
        let textString = "This is an example of long text. If the text doesn't fit in the current page. Simple pdf will draw a part of text, and automatically begin a new page to draw the remaining text. This process will be repeated until there's no text left to draw. "
        pdf.addText(textString)
        
        
        pdf.beginNewPage()
        pdf.addText("Begin new page")
        
        // Generate PDF data and save to a local file.
        /* if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
         
         let fileName = "example.pdf"
         let documentsFileName = documentDirectories + "/" + fileName
         
         let pdfData = pdf.generatePDFdata()
         do{
         try pdfData.writeToFile(documentsFileName, options: .DataWritingAtomic)
         print("\nThe generated pdf can be found at:")
         print("\n\t\(documentsFileName)\n")
         }catch{
         print(error)
         }
         }
         */
        let pdfData = pdf.generatePDFdata()
        
        
        
        
        
        
        
        
        
    }
    
    
    
}
