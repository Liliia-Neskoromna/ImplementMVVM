////
////  ViewModelBond.swift
////  ImplementMVVM
////
////  Created by Liliia Neskoromna on 25.11.2020.
////
//
//import Foundation
//
//protocol ObservableViewModelProtocol {
//    func fetchPerson()
//    func setError(_ message: String)
//    var allPerson: Observable<[Person]> { get  set } //1
//    var errorMessage: Observable<String?> { get set }
//    var error: Observable<Bool> { get set }
//}
//
//class TeamViewModel: ObservableViewModelProtocol {
//    
//    var errorMessage: Observable<String?> = Observable(nil)
//    var error: Observable<Bool> = Observable(false)
//    
//    var networkManager: NetworkingApi?
//    var allPerson: Observable<[Person]> = Observable([])
//    
//    let personName: Observable<String>
//    let personLastName: Observable<String>
//    
//    
//    init(manager: NetworkingApi = NetworkingApi()) {
//        self.networkManager = manager
//    }
//    
//    func setNetworkManager(manager: NetworkingApi) {
//        self.networkManager = manager
//    }
//    
//    func fetchPerson() {
//        self.networkManager!.loadData( completion:  { person in
//            self.allPerson = Observable(person)
//        })
//    }
//    
//    func setError(_ message: String) {
//        self.errorMessage = Observable(message)
//        self.error = Observable(true)
//    }
