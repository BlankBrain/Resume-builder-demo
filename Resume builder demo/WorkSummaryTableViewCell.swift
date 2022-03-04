//
//  WorkSummaryTableViewCell.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 4/3/22.
//

import UIKit

class WorkSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
