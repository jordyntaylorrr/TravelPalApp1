//
//  MapViewController.swift
//  TravelPalApp
//
//  Created by DMSIMAC04 on 12/11/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
    var currentUserLatitude = 37.773972
    var currentUserLongitude = -122.431297
    
    var locationAnnotations = [Location]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        determineMyCurrentLocation()
        print(currentUserLongitude)
        let initialLocation = CLLocation(latitude: currentUserLatitude, longitude: currentUserLongitude)
        zoomToLocation(location: initialLocation)
        mapView.delegate = self

        locationAnnotations.append(Location(title:"Golden gate Bridge", subtitle:"One of the most iconic bridges in the world, known for its red color", coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297), image: "goldengate.jpg"))
        mapView.addAnnotations(locationAnnotations)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func zoomToLocation(location: CLLocation){
        let regionCord = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(regionCord, animated: true)
    }
    
    func mapView( mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Location {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
                dequeueView.annotation = annotation
                view = dequeueView
            }else{
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
            }
            return view
        }
        return nil
    }
    
    
    
    func determineMyCurrentLocation() {
        print("Determining location")
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Setting location")
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        currentUserLatitude = userLocation.coordinate.latitude
        currentUserLongitude = userLocation.coordinate.longitude
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error")
        currentUserLatitude = 37.773972
        currentUserLongitude = -122.431297
        
    }
    
}
