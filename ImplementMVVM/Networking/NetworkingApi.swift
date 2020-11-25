//
//  NetworkingApi.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 24.11.2020.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class NetworkingApi {
    
    static let shared = NetworkingApi()
    
    func loadData(completion: @escaping ([Person]) -> Void) {
        
        var personArray = [Person]()
        
        AF.request(K.Urls.baseUrl, method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                guard let json = try? JSON(response.result.get()) else {
                    fatalError("Cannot get json")
                }
                
                let results = json["data"].arrayValue
                
                for result in results {
                    
                    let id = result["id"].intValue
                    let email = result["email"].stringValue
                    let firstName = result["first_name"].stringValue
                    let lastName = result["last_name"].stringValue
                    let image = result["avatar"].stringValue
                    
                    
                    let elementPerson = Person( id: id,
                                                email: email,
                                                first_name: firstName,
                                                last_name: lastName,
                                                avatar: image)
                    
                    personArray.append(elementPerson)
                }
                completion(personArray)
            
            case let .failure(error):
                print(error)
            }
        }
    }
}
