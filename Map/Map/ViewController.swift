//
//  ViewController.swift
//  Map
//
//  Created by mars on 2021/05/14.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var IbILocationInfo1: UILabel!
    @IBOutlet var IbILocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IbILocationInfo1.text = ""
        IbILocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
}
    func setAnootation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longtitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didupdateLocations location: [CLLocation]){
        let pLocation = location.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.IbILocationInfo1.text = "?????? ??????"
            self.IbILocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.IbILocationInfo1.text = " "
            self.IbILocationInfo2.text = " "
            locationManager.stopUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1 {
            setAnootation(latitudeValue: 37.751853, longtitudeValue: 128.87605740000004, delta: 1, title: "????????????????????? ???????????????", subtitle: "????????? ????????? ??????????????? 121")
            self.IbILocationInfo1.text = "?????? ?????? ??????"
            self.IbILocationInfo2.text = "????????????????????? ???????????????"
            
        }else if sender.selectedSegmentIndex == 2{
            setAnootation(latitudeValue: 37.556876, longtitudeValue:126.914066, delta: 0.1, title: "?????????????????????", subtitle: "????????? ????????? ???????????? 109 ????????? ??????")
            self.IbILocationInfo1.text = "?????? ?????? ??????"
            self.IbILocationInfo2.text = "????????????????????? ?????????"
        }
        else if sender.selectedSegmentIndex == 3 {
            setAnootation(latitudeValue: 37.50495, longtitudeValue:127.09331, delta: 0.1, title: "?????????", subtitle: "????????? ????????? ????????? 105?????? 201???")
            self.IbILocationInfo1.text = "?????? ?????? ??????"
            self.IbILocationInfo2.text = "?????????"
            
        }
    }
    

}

