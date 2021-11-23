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
    var contactsArray: [ContactEntity] = []
    
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
                        newPerson.first = person.name.first
                        newPerson.last = person.name.last
                        //newPerson.large = URL(person.picture.large)
                        //newPerson.medium = URL(person.picture.medium)
                        //newPerson.thumbnail = URL(person.picture.thumbnail)
                        newPerson.date = person.dob.date
                        newPerson.age = Int64(person.dob.age)
                        newPerson.email = person.email
                        newPerson.phone = person.phone
                        newPerson.city = person.location.city
                        newPerson.latitude = person.location.coordinates?.latitude
                        newPerson.longitude = person.location.coordinates?.longitude
                        
                    }
                    
                    // READ DATA
                    func updatePersons() {
                        let request: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest()
                        do{
                            self.contactsArray = try self.context.fetch(request)
                        } catch {
                            print("Error fetching data from context \(error)")
                        }
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
 


