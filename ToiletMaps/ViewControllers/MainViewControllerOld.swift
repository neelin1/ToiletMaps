//
//  MainViewController.swift
//  ToiletMaps
//
//  Created by Zane Neelin on 12/28/22.
//

import UIKit
import MapKit
import CoreLocation

class MainViewControllerOld: UIViewController, MKMapViewDelegate {
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(
        latitude: 34.108420,
        longitude: -118.447850)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Maps
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)),
                      animated: true)
        
        map.delegate = self
        
        addCustomPin()
        
        // Do any additional setup after loading the view.
        // Swiping
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
//
//        leftSwipe.direction = .left
//        rightSwipe.direction = .right
//
//        view.addGestureRecognizer(leftSwipe)
//        view.addGestureRecognizer(rightSwipe)
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Toilet Here"
        pin.subtitle = "Test"
        map.addAnnotation(pin)
    }
    
    // MARK: - Map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil{
            //Create the view
            annotationView = MKAnnotationView (
                annotation: annotation,
                reuseIdentifier: "custom"
                )
            annotationView?.canShowCallout = true
//            annotationView?.rightCalloutAccessoryView
        }
        else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "pin")
//        ?.resizableImage(withCapInsets: UIEdgeInsets(top: 0.5, left: 0, bottom: 0, right: 0.5))
        
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
    
//    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
//    {
//        if sender.direction == .left
//        {
//           print("Swipe left")
//           // show the view from the right side
//        }
//
//        if sender.direction == .right
//        {
//           print("Swipe right")
//           // show the view from the left side
//        }
//    }
}
