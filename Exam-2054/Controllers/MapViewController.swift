//
//  MapViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 13/11/2021.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let apiController = APIController()
    var contacts: [Contact] = []
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
                self.contacts = self.apiController.contacts
            }
        }
        
        getContactsOnMap()
        
        print(contacts)
        
    }
    
    func getContactsOnMap() {
        for contact in contacts {
            let pin = MKPointAnnotation()
            pin.title = contact.name.first
            
            let coordinate = CLLocationCoordinate2D(latitude: Double(contact.location.coordinates?.latitude ?? "").self ?? 0.1, longitude: Double(contact.location.coordinates?.longitude ?? "").self ?? 0.1)
            
            
            pin.coordinate = coordinate
            map.addAnnotation(pin)
            
        }
    }

}
