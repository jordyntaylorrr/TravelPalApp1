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
    
    let geocoder = CLGeocoder()
    
    var locationAnnotations = [Location]()
    let cordinate = CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297)
    
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
        
        //Navigate to location
        var request:MKDirectionsRequest = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: cordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667), addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.mapView.add(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
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
    //When annotation is clicked
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        let identifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.tintColor = .green                // do whatever customization you want
            annotationView?.canShowCallout = false            // but turn off callout
        } else {
            annotationView?.annotation = annotation
        }
        
    
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // do something
        print("Annotation clicked")
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4
        return renderer
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
    /*
    let address = "8787 Snouffer School Rd, Montgomery Village, MD 20879"
    geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
    if((error) != nil){
    print("Error", error ?? "")
    }
    if let placemark = placemarks?.first {
    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
    print("Lat: \(coordinates.latitude) -- Long: \(coordinates.longitude)")
    }
    })
    */
}
