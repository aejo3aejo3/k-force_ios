//
//  MapViewCell.swift
//  k-force_ios
//
//  Created by John on 2018/4/25.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewCell: UITableViewCell , GMSMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var placeClient : GMSPlacesClient!
    var zoomLevel : Float = 15.0
    
    var likelyPlaces : [GMSPlace] = []
    var selectedPlace : GMSPlace?
    
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.initLocationManager()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
    /*
     * 初始化locationManger
     */
    
    func initLocationManager(){
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placeClient = GMSPlacesClient.shared()
    }
    
    func showCurrentLocation(){
//            let camera = GMSCameraPosition.camera(withLatitude: lo, longitude: <#T##CLLocationDegrees#>, zoom: <#T##Float#>)
    }
    
    /*
     * 實作mapView
     */
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location : CLLocation = locations.last!
        NSLog( "current location : \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude, zoom: zoomLevel)
        
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.camera = camera
        }
        
        // 地圖上顯示目前位置的小藍點
        mapView.isMyLocationEnabled = true
    
        // 地圖上顯示回到目前位置的箭頭
        mapView.settings.myLocationButton = true
        
        
        //        self.showCurrentLocation()
//        self.locationManager.stopUpdatingLocation()

        dynamicAddMarker(location)
        
        
    }

    /*
     * 監聽使用者對於location permmission的選擇
     */
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            NSLog("Location access was restricted")
        case .denied:
            NSLog("User denied to location")
            mapView.isHidden = false
        case .notDetermined:
            NSLog("User not determined the status")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse :
            NSLog("Locatoin status is ok")
    
        }
    }
    
    /*
     * 取得使用者當前位置錯誤
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        NSLog("locaiton error : \(error)")
    }

    /*
     * 動態新增maker到地圖上
     */
    
    func dynamicAddMarker(_ location : CLLocation){
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        marker.title = "riease"
        marker.map = mapView
    }
    
    
}
