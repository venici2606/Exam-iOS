//
//  APIController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//


import Foundation
import CoreData
import UIKit

class APIController {
    
    //var contacts: [Contact] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let baseURL = URL(string: "https://randomuser.me/api/?results=100&seed=ios&nat=no")!
        typealias CompletionHandler = (Error?) -> Void
        
        func getContacts(completion: @escaping CompletionHandler = {_ in }) {
            
    
            URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
                if let error = error {
                    NSLog("Error getting contacts: \(error)")
                }
                guard let data = data else {
                    NSLog("No data returned from data task.")
                    completion(nil)
                    return
                }
                do {
                    let newContacts = try JSONDecoder().decode(ContactsData.self, from: data)
                    //print(newContacts)
                    for person in newContacts.results{
                        let newPerson = ContactEntity(context: self.context)
                        newPerson.age = Int64(person.dob.age)
                        newPerson.first = person.name.first
                        newPerson.last = person.name.last
                    }
                    
                        try self.context.save()
                    
                    //self.contacts = newContacts.results
                } catch {
                    NSLog("Error decoding contacts: \(error)")
                    completion(error)
                }
                completion(nil)
            }.resume()
        }
    
}
 


