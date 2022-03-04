//
//  ResumeTableViewCell.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class ResumeTableViewCell: UITableViewCell {

    @IBOutlet weak var resumeStackView: UIStackView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var MobileNumber: UILabel!
    @IBOutlet weak var Email: UILabel!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
