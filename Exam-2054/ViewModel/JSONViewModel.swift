//
//  JSONViewModel.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 22/11/2021.
//

import Foundation
import SwiftUI

class JSONViewModel: ObservableObject {
    
    @Published var contacts : [Contact] = []
    
    func fetchData() {
        let url = "https://randomuser.me/api/?results=100&seed=ios&nat=no"
        
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("swiftui2.0", forHTTPHeaderField: "field")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            
            guard let jsonData = data else{return}
            
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                print("error API Error")
                return
            }
            
            
            do{
                let contacts = try JSONDecoder().decode([Contact].self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.contacts = contacts
                }
            } catch {
                print(error.localizedDescription)
            }
            
            
            
        }
        
    }
    
}
