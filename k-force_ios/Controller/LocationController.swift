//
//  LocationController.swift
//  k-force_ios
//
//  Created by John on 2018/4/20.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleSignIn
class LocationController: UIViewController, UITableViewDelegate, UITableViewDataSource, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var searchController : UISearchController!
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var placeClient : GMSPlacesClient!
    var zoomlevel : Float = 15.0
    
    // 下面兩個變數先宣告，目前暫時沒用到，等api拿到地點資料再放進去likeyPlaces
//    var likeyPlaces : [GMSPlace] = []
//    var selectedPlace : GMSPlace?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
            tableView.delegate = self
            tableView.dataSource = self

         tableView.cellLayoutMarginsFollowReadableWidth = true
       
     
      
        
        
        
        initNavigationBar()
//        initSearchController()
        initLocationManager()
        
        self.tabBarController?.tabBar.barTintColor = UIColor(netHex: 0x65669c)
        
        var newBt = UITabBarItem()
        newBt.image = UIImage(named: "injury")
        
        
        self.tabBarController?.tabBarItem = newBt
        
    }
    
    /*
     * 自訂導覽列style
     */
    func initNavigationBar(){
        
        let nav = navigationController?.navigationBar
        
        nav?.barTintColor = UIColor(netHex: 0x65669c)
        
        if let font = UIFont(name: "PingFang TC", size: 20.0) {
           nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(netHex: 0xffffff), NSAttributedStringKey.font : font]
        }
      
        // navigation bar icon color
        nav?.tintColor = UIColor(netHex: 0xffffff)
        

    }
    
    

    
    
    

    func initSearchController() {
        
        print("do search controller")
        
        
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "搜尋關鍵字..."
        searchController.searchBar.barTintColor = UIColor(netHex: 0x65669c)
//        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.tintColor = UIColor(red: 231, green: 76, blue: 60)
        

    
        self.tabBarController?.navigationItem.searchController = nil
        
        

        
//        tableView.tableHeaderView = searchController.searchBar
        
    }
    
     func showSearchBar(_ sender : UIImageView){
        

        self.tabBarController?.navigationItem.searchController = searchController
        }
    
    
    func initLocationManager(){
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placeClient = GMSPlacesClient.shared()
    }

   
    /*
     * 初始化mapView內的物件
     */
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        currentLocation = locations.last!
        NSLog("current location : \(currentLocation!)")
        
        let cameraPosition = GMSCameraPosition.camera(withLatitude: currentLocation!.coordinate.latitude,
                                                      longitude: currentLocation!.coordinate.longitude, zoom: zoomlevel)
  
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = cameraPosition
        } else {
            mapView.camera = cameraPosition
        }
     
        // 地圖上顯示目前位置的小藍點
        mapView.isMyLocationEnabled = true
        
        // 地圖上顯示回到目前位置的箭頭
        mapView.settings.myLocationButton = true
        
        
    }
    
    /*
     * 監聽使用者對於location permmision的選擇
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
     * 取得使用者當前位置的exception
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("location error : \(error)")
        locationManager.stopUpdatingLocation()
    }

    /*
     * 動態新增marker到地圖上
     */
    
    func dynamicAddMarkers( _ location : CLLocation) {
        
        let marker = GMSMarker(position: CLLocationCoordinate2DMake(currentLocation!.coordinate.latitude, currentLocation!.coordinate.longitude))
        
        marker.title = "Riease"
        marker.map = mapView
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }

    /*
     * 初始化每個cell的內容
     */
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for : indexPath) as! LocationCell
        return cell
        

    }
    

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 162.0
    }


   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 讓使用者選了之後不會顯示被選擇的動畫
        tableView.deselectRow(at: indexPath, animated: false)
        
        
  
        
        //TODO 選了之後跳到詳細地點內頁
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        // 初始化mainTitle
        self.tabBarController?.navigationItem.title = "查詢地點"

        
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: 15 , height: 15)
    
        let imgSearch = UIImageView(image: UIImage(named: "search"))
        imgSearch.frame = CGRect(x: 0, y: 0, width: 15 , height: 15)

        leftView.addSubview(imgSearch)
        //customView 裡面不要加imageView，改加view
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))
        
        // add it to the image view;
        imgSearch.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        imgSearch.isUserInteractionEnabled = true
        
       
        
    
    }

  
    var isSearch = false
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
            
            if (!isSearch) {
                 isSearch = true
            
        self.tabBarController?.navigationItem.searchController = self.searchController
                
            } else if (isSearch) {
                isSearch = false



                self.tabBarController?.navigationItem.searchController = nil
                

                //                self.tabBarController?.navigationItem.searchController?.searchBar.transform = CGAffineTransform(translationX: 0, y: 30)
                
//                UIView.animate(withDuration: 1.0 , animations: {
//                   self.searchController.searchBar.alpha = 0.0
//                    self.tabBarController?.navigationItem.searchController = self.searchController
//
//
//                }) { (value : Bool) in
//                    print("after animation")
//                }
             
            }
            
       
       
            
            
        } else {
            print("image tapped fail")
        }
    }

    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
