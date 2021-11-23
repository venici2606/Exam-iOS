//
//  MapViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 13/11/2021.
//

import Foundation
import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let apiController = APIController()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var contactsArray: [ContactEntity] = []
    let map = MKMapView()


    override func viewDidLoad() {
    
        super.viewDidLoad()

        map.delegate = self
        
        view.addSubview(map)
        map.frame = view.bounds
    
        apiController.getContacts { (error) in
            if let error = error {
                NSLog("Error performing data task: \(error)")
            }
            DispatchQueue.main.async {
                self.contactsArray = self.apiController.contactsArray
                self.getContactsOnMap()
            }
        }
    }
    
    
    func getContactsOnMap() {
        for contact in contactsArray {
            let pin = MKPointAnnotation()
            pin.title = contact.first
            
            
            let coordinate = CLLocationCoordinate2D(latitude: Double(contact.latitude ?? "").self ?? 0.1, longitude: Double(contact.longitude ?? "").self ?? 0.1)
            
            pin.coordinate = coordinate
            map.addAnnotation(pin)
            print(coordinate)
        }
    }

}
