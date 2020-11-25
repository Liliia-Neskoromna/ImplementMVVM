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
    @IBOutlet weak var setEmail: UILabel!
    @IBOutlet weak var showEmailButton: UIButton!
    
    var teamViewModel: TeamViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setValues()
    }
    
    func setValues() {
        personImage.imageFromServerURL(teamViewModel.avatar)
        personName.text     = teamViewModel.firstName
        personLastName.text = teamViewModel.lastName
        personEmail.text    = teamViewModel.email
    }
    
    func bindViewModel() {
        if let viewModel = teamViewModel {
            viewModel.emailText.bind({ (emailText) in
                DispatchQueue.main.async {
                    self.setEmail.text = emailText
                }
            })
        }
    }
    
    @IBAction func onButtonTypped( _ sender: UIButton) {
        teamViewModel?.userTriggeredShowEmailButton()
    }
}


