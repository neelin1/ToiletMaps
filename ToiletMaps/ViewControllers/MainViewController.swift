//
//  MainViewController.swift
//  ToiletMaps
//
//  Created by Zane Neelin on 1/1/23.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    var locArr : [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        loadBathrooms()
    }
    
    func loadBathrooms() {
        locArr.removeAll()
        let loc1 = CLLocation(latitude: 35.108420, longitude: -118.447850)
        let loc2 = CLLocation(latitude: 34.108420, longitude: -118.447850)
        let loc3 = CLLocation(latitude: 34.5, longitude: -117)
        let loc4 = CLLocation(latitude: 35, longitude: -120)
        let loc5 = CLLocation(latitude: 33, longitude: -117)
        locArr.append(loc1)
        locArr.append(loc2)
        locArr.append(loc3)
        locArr.append(loc4)
        locArr.append(loc5)
        for arr in locArr {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: arr.coordinate.latitude, longitude: arr.coordinate.longitude)
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        
        if currentLocation == nil {
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                mapView.setRegion(viewRegion, animated: false)
            }
        }
    }
}
