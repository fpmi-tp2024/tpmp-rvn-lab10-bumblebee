//
//  LocationManager.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit
import Foundation
import CoreLocation

class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
       
       override init() {
           super.init()
           self.locationManager.delegate = self
           self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
           self.locationManager.requestWhenInUseAuthorization()
           
       }
       
       // - API
       public var exposedLocation: CLLocation? {
           return self.locationManager.location
       }
       
       
   }

   // MARK: - Core Location Delegate
   extension LocationManager: CLLocationManagerDelegate {
       
       
       func locationManager(_ manager: CLLocationManager,
                            didChangeAuthorization status: CLAuthorizationStatus) {

           switch status {
       
           case .notDetermined         : print("notDetermined")        // location permission not asked for yet
           case .authorizedWhenInUse   : print("authorizedWhenInUse")  // location authorized
           case .authorizedAlways      : print("authorizedAlways")     // location authorized
           case .restricted            : print("restricted")           // TODO: handle
           case .denied                : print("denied")               // TODO: handle
           @unknown default:
               fatalError()
           }
       }
   }

   // MARK: - Get Placemark
   extension LocationManager {
       
       func getPlace(for location: CLLocation,
                     completion: @escaping (CLPlacemark?) -> Void) {
           
           let geocoder = CLGeocoder()
           geocoder.reverseGeocodeLocation(location) { placemarks, error in
               
               guard error == nil else {
                   print("*** Error in \(#function): \(error!.localizedDescription)")
                   completion(nil)
                   return
               }
               
               guard let placemark = placemarks?[0] else {
                   print("*** Error in \(#function): placemark is nil")
                   completion(nil)
                   return
               }
               
               completion(placemark)
           }
       }
   }

   // MARK: - Get Location
   extension LocationManager {
       
       
       func getLocation(forPlaceCalled name: String,
                        completion: @escaping(CLLocation?) -> Void) {
           
           let geocoder = CLGeocoder()
           
           geocoder.geocodeAddressString(name) { placemarks, error in
               
               guard error == nil else {
                   print("*** Error in \(#function): \(error!.localizedDescription)")
                   completion(nil)
                   return
               }
               
               guard let placemark = placemarks?[0] else {
                   print("*** Error in \(#function): placemark is nil")
                   completion(nil)
                   return
               }
               
               guard let location = placemark.location else {
                   print("*** Error in \(#function): placemark is nil")
                   completion(nil)
                   return
               }

               completion(location)
           }
       }
   }
