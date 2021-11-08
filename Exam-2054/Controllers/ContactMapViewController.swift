//
//  ContactMapViewController.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 08/11/2021.
//

import UIKit
import MapKit
import CoreLocation

class ContactMapViewController: UIViewController, MKMapViewDelegate {
    
    let apiController = APIController()
    var contact = Contact.self
    
    
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(
        latitude: 40.728,
        longitude: -74
    ) // contact.location.lat ...?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        ),
        animated: false)
        
        map.delegate = self
        
        addCustomPin()
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Contact Here"
        map.addAnnotation(pin)
    }
    
    // MAP
    
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
        
        annotationView?.image = UIImage(named: "user")
        
        return annotationView
        
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
