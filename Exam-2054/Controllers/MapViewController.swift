//
//  MapViewController.swift
//  Exam-2054
//
//  Created by Candidate 2054
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
                self.getContactsOnMap()
            }
        }
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // Create the view
            annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "custom")
            annotationView?.canShowCallout = true // tapping on the point
            
        } else {
            annotationView?.annotation = annotation
        }
        
        let imageData = try! Data(contentsOf: (contacts.removeFirst().picture.thumbnail))
        annotationView?.image = UIImage(data: imageData)
        
        //annotationView?.image = UIImage(named: "user")
        
        return annotationView
        
    }

}
