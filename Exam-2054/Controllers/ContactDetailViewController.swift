//
//  ContactDetailViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
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
        guard isViewLoaded,
              let contact = contact else { return }
        title = contact.name.first?.capitalized
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
