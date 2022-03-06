//
//  Utility.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import Foundation
import UIKit


class utility {
    static func showAlart(_ inViewController: UIViewController, title: String , message: String)
    {
        let alert = UIAlertController(title: title , message: message , preferredStyle: .alert)
                             alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                             inViewController.present(alert, animated: true)
    }
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
