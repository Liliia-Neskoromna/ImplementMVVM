//
//  PersonTableViewCell.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 24.11.2020.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personLastName: UILabel!
    
    var teamViewModel: TeamViewModel! {
        
        didSet {
            personImage.imageFromServerURL(teamViewModel.avatar)
            personName.text     = teamViewModel.firstName
            personLastName.text = teamViewModel.lastName
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
