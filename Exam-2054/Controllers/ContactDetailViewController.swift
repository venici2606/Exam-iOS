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
    
    @IBOutlet weak var birthdayEmoji: UIImageView!
    
    @IBOutlet weak var viewOnMapBtn: UIButton!
    
    
    
    var contact: Contact? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        contactBirthday()
        
        
    }
    
    func updateViews() {
        guard isViewLoaded,
              let contact = contact else { return }
        title = contact.name.first.capitalized + " " + contact.name.last.capitalized
        
        guard let imageData = try? Data(contentsOf: contact.picture.large) else { fatalError() }
        imageView.image = UIImage(data: imageData)
        fNameLabel.text = contact.name.first
        
        lNameLabel.text = contact.name.last
        
        dateLabel.text = String(String(contact.dob.date).prefix(10))
        ageLabel.text = String(contact.dob.age)
        
        emailLabel.text = contact.email
        phoneLabel.text = contact.phone
        cityLabel.text = contact.location.city
    
    }
    
    
    
    
    func contactBirthday() {
        
        let contactBirthday = contact!.dob.date.prefix(10)
        let formattedBDay = contactBirthday.suffix(5)

        // FORMATTING CONTACTS BIRTH DATE
        //let formatter = DateFormatter()
        //formatter.dateFormat = "MM-dd"
        
            
        let currentDate = Date()
        
        // TODAYS DATE
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        print("Todays date: " + dateFormatter.string(from: currentDate))
        print("Persons birthday: " + formattedBDay)
        
        //let birthdayCake = "🎂" // "\u{1F382}"
        
        
        
        if dateFormatter.string(from: currentDate) == formattedBDay {
            print("It's \(contact?.name.first) BIRTHDAY!!!")
            birthdayEmoji.alpha = 1
        }
        
        
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
