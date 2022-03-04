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
