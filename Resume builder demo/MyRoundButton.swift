//
//  MyRoundButton.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit

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
