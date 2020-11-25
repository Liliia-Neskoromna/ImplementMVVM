//
//  TeamViewModel.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 25.11.2020.
//

import Foundation
import Alamofire

class TeamViewModel  {
    
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
        
    init(person: Person) {
        self.id = person.id
        self.email = person.email
        self.firstName = person.first_name
        self.lastName = person.last_name
        self.avatar = person.avatar
    } 
}
