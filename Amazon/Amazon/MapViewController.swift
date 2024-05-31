//
//  MapViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit
import CoreData
import CoreLocation
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    private var locationManager = LocationManager()
    
    @IBOutlet weak var editableLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let centerCoordinate = CLLocationCoordinate2D(latitude: 53.9045, longitude: 27.5615)
        let span = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotations = [
            ["title": "1", "latitude": 53.92, "longitude": 27.58],
            ["title": "2", "latitude": 53.96, "longitude": 27.48],
            ["title": "3", "latitude": 53.90, "longitude": 27.44],
            ["title": "4", "latitude": 53.84, "longitude": 27.56],
            ["title": "5", "latitude": 53.91, "longitude": 27.65],
            ["title": "6", "latitude": 53.88, "longitude": 27.68],
            ["title": "7", "latitude": 53.90, "longitude": 27.35],
            ["title": "8", "latitude": 53.8972, "longitude": 27.5321],
            ["title": "9", "latitude": 53.9234, "longitude": 27.5812],
            ["title": "10", "latitude": 53.8790, "longitude": 27.6103]
        ]
        
        for annotation in annotations {
            if let latitude = annotation["latitude"] as? CLLocationDegrees, let longitude = annotation["longitude"] as? CLLocationDegrees {
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let pin = MKPointAnnotation()
                if let title = annotation["title"] as? String {
                    pin.title = title
                }
                pin.coordinate = coordinate
                mapView.addAnnotation(pin)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = mapView.selectedAnnotations.first as? MKPointAnnotation {
            if let title = annotation.title, let warehouseNumber = Int(title) {
                editableLabel.text = "You chose warehouse \(warehouseNumber)"
            }
        }
    }
    
    private func markLocation(title: String, location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
    }

}
