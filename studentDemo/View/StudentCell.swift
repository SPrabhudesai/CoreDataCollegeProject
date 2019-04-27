//
//  SaveCollegeVC.swift
//  studentDemo
//
//  Created by shailesh on 27/04/19.
//  Copyright © 2019 shailesh. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var collegeNameLabel: UILabel!
    @IBOutlet weak var collegeUniversity: UILabel!
    @IBOutlet weak var collegeCityLabel: UILabel!
    @IBOutlet weak var collegeAddress: UILabel!
    
    var college:College?{
        didSet{
            collegeNameLabel.text  = college?.name
            collegeUniversity.text = college?.university
            collegeCityLabel.text  = college?.city
            collegeAddress.text    = college?.address
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
