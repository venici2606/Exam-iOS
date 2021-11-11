//
//  APIController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//

import Foundation
import UIKit
import CoreData

class APIController {
    
    var contacts: [Contact] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let baseURL = URL(string: "https://randomuser.me/api/?format=json&results=100")!
        typealias CompletionHandler = (Error?) -> Void
        
        func getContacts(completion: @escaping CompletionHandler = {_ in }) {
            URLSession.shared.dataTask(with: baseURL) { [self] (data, _, error) in
                if let error = error {
                    NSLog("Error getting contacts: \(error)")
                }
                guard let data = data else {
                    NSLog("No data returned from data task.")
                    completion(nil)
                    return
                }
                do {
                    let newContacts = context.self
                    print(newContacts)
                    //self.contacts = newContacts.results
                } catch {
                    NSLog("Error decoding contacts: \(error)")
                    completion(error)
                }
                completion(nil)
            }.resume()
        }
    
}
