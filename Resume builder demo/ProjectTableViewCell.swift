//
//  ProjectTableViewCell.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectname: UILabel!
    @IBOutlet weak var teamSize: UILabel!
    @IBOutlet weak var projectSummary: UILabel!
    @IBOutlet weak var Tech: UILabel!
    @IBOutlet weak var Role: UILabel!
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)




    }

}
