//
//  PersonDetailsViewController.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 25.11.2020.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personLastName: UILabel!
    @IBOutlet weak var personEmail: UILabel!
    
    var teamViewModel: TeamViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personImage.imageFromServerURL(teamViewModel.avatar)
        personName.text     = teamViewModel.firstName
        personLastName.text = teamViewModel.lastName
        personEmail.text    = teamViewModel.email
    }
}


