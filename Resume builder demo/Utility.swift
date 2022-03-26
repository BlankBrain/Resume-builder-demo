//
//  Utility.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import Foundation
import UIKit
import CoreData


class utility {
    static func showAlart(_ inViewController: UIViewController, title: String , message: String)
    {
        let alert = UIAlertController(title: title , message: message , preferredStyle: .alert)
                             alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                             inViewController.present(alert, animated: true)
    }
   static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: validation
 

}
extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 5, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.masksToBounds = true
    }

}

@IBDesignable
class myRoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
         didSet{
         self.layer.cornerRadius = cornerRadius
             
         }
     }

     @IBInspectable var borderWidth: CGFloat = 0{
         didSet{
             self.layer.borderWidth = borderWidth
         }
     }

     @IBInspectable var borderColor: UIColor = UIColor.clear{
         didSet{
             self.layer.borderColor = borderColor.cgColor
         }
     }
    
  
    

}
extension String {

    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    var isEmail: Bool {
          do {
              let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
              return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
          } catch {
              return false
          }
      }
    var isValidPhone: Bool {
         let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
         let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
         return testPhone.evaluate(with: self)
      }
   
}
