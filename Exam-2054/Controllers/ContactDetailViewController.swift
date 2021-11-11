//
//  ContactDetailViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    

    @IBOutlet weak var viewOnMapBtn: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contact: Contact? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        
        
    }
    
    func updateViews() {
        
        let contact = Contact(context: self.context)
        
        guard isViewLoaded,
              let contact = self.contact else { return }
        
        
        title = contact.first!.capitalized + " " + contact.last!.capitalized
        /*
        guard let imageData = try? Data(contentsOf: contact.large) else { fatalError() }
        imageView.image = UIImage(data: imageData)
       */
        fNameLabel.text = contact.first
        
        lNameLabel.text = contact.last
        
        dateLabel.text = contact.date
        ageLabel.text = String(contact.age)
        
        emailLabel.text = contact.email
        phoneLabel.text = contact.phone
        cityLabel.text = contact.city
        
        
    }
    
    @objc func mapBtn() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "MapViewController") as! MapViewController
        
        self.present(controller, animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
