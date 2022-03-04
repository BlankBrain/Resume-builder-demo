//
//  EducationTableViewCell.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class EducationTableViewCell: UITableViewCell {

    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var passingYear: UILabel!
    @IBOutlet weak var Gpa: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
