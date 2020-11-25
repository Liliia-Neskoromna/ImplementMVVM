////
////  ViewModelRX.swift
////  ImplementMVVM
////
////  Created by Liliia Neskoromna on 25.11.2020.
////
//
//import UIKit
//import RxSwift
//
//final class ViewModelRX {
//    
//    private let networking = NetworkingApi()    
//    
//    let personName: PublishSubject<String>
//    let personLastName: PublishSubject<String>
//    let personEmail: PublishSubject<String>
//    let personAvatar: PublishSubject<String>
//    
//    private var allPerson: Person? {
//        didSet {
//            if let name = allPerson?.first_name {
//                DispatchQueue.main.async {
//                    self.personName.onNext(name)
//                }
//            }
//            if let lastName = allPerson?.last_name {
//                DispatchQueue.main.async {
//                    self.personLastName.onNext(lastName)
//                }
//            }
//        }
//    }
//    
//    init(manager: NetworkingApi) {
//        
//        self.networking = manager
//        
//        self.networking.loadData( completion:  { person in
//            self.allPerson = Observable<person>
//        })
//    }
//    
//    
//}
