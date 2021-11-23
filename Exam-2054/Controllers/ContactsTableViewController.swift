//
//  ContactsTableViewController.swift
//  Exam-2054
//
//  Created by Candidate 2054
//

import UIKit
import CoreData

class ContactsTableViewController: UITableViewController {

    let apiController = APIController()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var contactsArray: [ContactEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
             print(urls[urls.count-1] as URL)
        
       if contactsArray.count == 0 {
        apiController.getContacts { (error) in
            if let error = error {
                NSLog("Error performing data task: \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }

        }
       }
        let fetchRequest: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest()
            do {
                contactsArray = try context.fetch(fetchRequest)
                tableView.reloadData()
            } catch {
                print(error)
            }
        
        // VIEW ON MAP button
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(contactsArray.count > 0){
            return contactsArray.count
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let contact = contactsArray[indexPath.row]
        
        //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        cell.textLabel?.text = contact.first!.capitalized + " " + contact.last!.capitalized
        
        let urlFromString = URL(string: contact.medium!)
        guard let imageData = try? Data(contentsOf: urlFromString!) else { fatalError() }
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
            let contact = contactsArray[indexPath.row]
            contactDetailVC.contact = contact
        }
    }
    
    
   
    

}
