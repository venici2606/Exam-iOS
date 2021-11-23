//
//  ContactMapViewController.swift
//  Exam-2054
//
//  Created by Candidate 2054
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ContactMapViewController: UIViewController, MKMapViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var contactsArray: [ContactEntity] = []
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(
        latitude: 59.911491,
        longitude: 10.757933
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
        
        let fetchRequest: NSFetchRequest<ContactEntity> = ContactEntity.fetchRequest()
            do {
                contactsArray = try context.fetch(fetchRequest)
                
            } catch {
                print(error)
            }
        
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
