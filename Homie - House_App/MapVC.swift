//
//  MapVC.swift
//  House_App
//
//  Created by TryCatch Classes on 29/09/22.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    
    //outlets
    @IBOutlet weak var MapLook: UIView!
    @IBOutlet weak var mapKV: MKMapView!
    @IBOutlet weak var backbtn2:UIButton!
    @IBOutlet weak var mapLowView: UIView!
    @IBOutlet weak var CollectV4: UICollectionView!
    
    //parameters
    var e_house = ["Downey", "Inglewood", "Torrance", "Exclusive house"]
    var e_dist = ["5.9 km from you","2.7 km from you",
                  "3.5 km from you","1.5 km from you",]
    var e_rent = ["$45,000","$34,000", "$28,000", "$89,000"]
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //map view code
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //setting accurate location for Los Angeles
        let lat : CLLocationDegrees = 33.928059
        let long : CLLocationDegrees  =  -118.199173
        let look = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let latDelta : CLLocationAccuracy  = 0.6
        let longDelta : CLLocationAccuracy = 0.6
        
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: look, span: span)
        mapKV.setRegion(region, animated: true)
        
        //map layer properties
        mapKV.layer.cornerRadius = 30
        mapLowView.layer.cornerRadius = 30
        
        //to pin on map
        showAnnotationOnMap()
        
        // 4th Collection View
        CollectV4.delegate =  self
        CollectV4.dataSource = self
        CollectV4.layer.cornerRadius = 15 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    
    @IBAction func backbtn_action(_ sender: Any) {
        let back = storyboard?.instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailVC
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations look: [CLLocation]) {
        guard let location = look.first else{
            print("Error")
            return
        }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapKV.setRegion(region, animated: true)
        
        
        MapLook.layer.cornerRadius = 30
    }
    
    func showAnnotationOnMap() {
        
        let locations = [
            ["title": "Lynwood","latitude": 33.928059, "longitude": -118.199173],
            ["title": "Beverly Hills", "latitude": 34.080292, "longitude": -118.404678],
            ["title": "Palos Verdes", "latitude": 33.753681, "longitude": -118.349145],
            ["title": "Lakewood", "latitude": 33.853626, "longitude": -118.133957],
            ["title": "El Monte", "latitude": 34.071201, "longitude": -118.031128],
            ["title": "Monrovio", "latitude": 34.145910, "longitude": -118.000930],
            ["title": "La Puente", "latitude": 33.887238, "longitude": -118.352577],
            ["title": "Cypress", "latitude": 34.185680, "longitude": -118.131508],
            ["title": "Hacienda Heights", "latitude": 33.996368, "longitude": -117.963600],
            ["title": "Pico Rivera", "latitude": 33.999451, "longitude": -118.079369],
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapKV.addAnnotation(annotation)
        }
    }
    
}

extension MapVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let block4 = CollectV4.dequeueReusableCell(withReuseIdentifier: "block4", for: indexPath) as! block4CVC
        block4.exclu_img.image = UIImage(named: e_house[indexPath.row])
        block4.exclu_name.text = e_house[indexPath.row]
        block4.exclu_dist.text = e_dist[indexPath.row]
        block4.exclu_rent.text = e_rent[indexPath.row]
        
        //block4 properties
        block4.exclu_img.layer.cornerRadius = 15
        block4.exclu_btn.layer.cornerRadius = 15
        block4.layer.cornerRadius = 15
        return block4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((collectionView.frame.width - 4 ) / 1)
        let height = ((collectionView.frame.height - 20 ) / 1)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
         return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
