//
//  ServiceController.swift
//  comfortHotel
//
//  Created by TST-APP-02 on 9/5/2562 BE.
//  Copyright © 2562 Hitachi. All rights reserved.
//

import UIKit
import MapKit


class ServiceController: UIViewController {
    
    @IBOutlet weak var nyMapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//      สิ่งที่จะเกิดขึ้นครั้งแรก
//      showMap(last: 13.571689, lang: 100.765554)
        showMapType2(last: 13.571689, lang: 100.765554)
        
    } //Main Method
    
    func showMapType2(last: Double, lang: Double) -> Void {
        let latitude: CLLocationDegrees = last
        let longtitude: CLLocationDegrees = lang
        
//      Zoom Value
        let laDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: laDelta, longitudeDelta: longDelta)
//      พิกัด
        let addressCompany: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: addressCompany, span: span)
        
        self.nyMapView.setRegion(region, animated: true)
        
//      Company Anotation (Info)
        let companyAnotation = MKPointAnnotation()
        companyAnotation.coordinate = addressCompany
        companyAnotation.title = "Address Company"
        companyAnotation.subtitle = "Hitachi Transport Vantec"
        self.nyMapView.addAnnotation(companyAnotation)
        
//      Bus Stop
        let latitudeBus: CLLocationDegrees = 13.571273
        let longtitudeBus: CLLocationDegrees = 100.763647
        
        let busStopAnotation = MKPointAnnotation()
        busStopAnotation.coordinate = CLLocationCoordinate2D(latitude: latitudeBus, longitude: longtitudeBus)
        busStopAnotation.title = "Bus Stop"
        busStopAnotation.subtitle = "Bus Stop park 234,456,788"
        self.nyMapView.addAnnotation(busStopAnotation)
        
    }
    
    func showMap(last: Double, lang: Double) -> Void {
        let homeCordinate = CLLocationCoordinate2DMake(last, lang)
//      ระยะซูม
        let regionDistance: CLLocationDistance = 1000
        let regionSpan = MKCoordinateRegion.init(center: homeCordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
//      ตัวปักหมุด
        let placemark = MKPlacemark(coordinate: homeCordinate)
//      จุดที่จะปักหมุด
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Address Company"
        mapItem.openInMaps(launchOptions: options)

    }
}//Main Class
