//
//  ContactsTableViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//

import UIKit
import CoreData
import SwiftUI

class ContactsTableViewController: UITableViewController {
    

    @StateObject var jsonModel = JSONViewModel()
    //let apiController = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if jsonModel.contacts.isEmpty{
            ProgressView()
        } else {
            List(jsonModel.contacts,id: \.self) { contact in
                
                
            }
        }
        // VIEW ON MAP button
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return apiController.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let contact = apiController.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name.first.capitalized + " " + contact.name.last.capitalized
        
        guard let imageData = try? Data(contentsOf: contact.picture.medium) else { fatalError() }
        cell.imageView?.image = UIImage(data: imageData)
        
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactDetail" {
            guard let contactDetailVC = segue.destination as? ContactDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let contact = apiController.contacts[indexPath.row]
            contactDetailVC.contact = contact
        }
    }
    
    
   
    

}
