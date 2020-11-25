//
//  ViewController.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 24.11.2020.
//

import UIKit

final class ViewController: UIViewController {
    
    private var teamViewModels = [TeamViewModel]()
    private var network = NetworkingApi.shared
    private var selectedPerson: TeamViewModel!
    
    @IBOutlet weak private var teamTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getPerson()
    }
    
    private func setupTableView() {
        let personNib = UINib.init(nibName: K.nibName, bundle: nil)
        self.teamTableView.register(personNib, forCellReuseIdentifier: K.personCellId)
    }
    
    private func getPerson() {
        network.loadData( completion:  { person in
            self.teamViewModels = person.map { TeamViewModel(person: $0) }
            self.teamTableView.reloadData()
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let personCell = tableView.dequeueReusableCell(withIdentifier: K.personCellId, for: indexPath) as! PersonTableViewCell
        personCell.teamViewModel = teamViewModels[indexPath.row]
        
        return personCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPerson = teamViewModels[indexPath.row]
        performSegue(withIdentifier: K.detailsSegueId, sender: nil)
        
        self.teamTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.detailsSegueId {
            let detailsVC = segue.destination as! PersonDetailsViewController
            detailsVC.teamViewModel = selectedPerson
        }
    }
}
