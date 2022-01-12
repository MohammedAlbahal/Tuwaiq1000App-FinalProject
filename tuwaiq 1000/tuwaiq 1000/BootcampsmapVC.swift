////
////  BootcampsmapVC.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhtani on 09/06/1443 AH.
////
//
//import Foundation
//
//import UIKit
//import MapKit
//
//class Bootcsmpsmap: UIViewController , UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
//    let centerMapButton: UIButton = {
//
//        let button = UIButton()
//        button.tintColor = .white
//        button.backgroundColor = .systemBlue
//        button.translatesAutoresizingMaskIntoConstraints = false
//        if #available(iOS 13.0, *) {
//            button.setImage(UIImage(systemName: "location.fill"), for: .normal)
//        } else {
//            // Fallback on earlier versions
//        }
//        button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
//
//        return button
//    }()
//    @objc func handleCenterLocation() {
//        centerMapOnUserLocation()
//    }
//
//    func centerMapOnUserLocation() {
//        guard let coordinate = locationManager.location?.coordinate else { return }
//    }
//
//    var mapView: MKMapView!
//    var locationManager: CLLocationManager!
//    @IBOutlet weak var myMapView: MKMapView!
//
//    @IBAction func searchBar(_ sender: Any) {
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.delegate = self
//        present(searchController, animated: true, completion: nil)
//    }
//    func configureMapView() {
//
//        mapView = MKMapView()
//
//        let m1 = MKPointAnnotation()
//        m1.title = "Tuwaiq 1000 Bootcamp"
//        m1.coordinate = CLLocationCoordinate2D(latitude: 18.2497564,
//                                               longitude: 42.5567473)
//        myMapView.addAnnotation(m1)
//    }
//
//    func configureLocationManager() {
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        UIApplication.shared.beginIgnoringInteractionEvents()
//
//        //ActivityIndicator
//        let activityIndicator = UIActivityIndicatorView()
//        activityIndicator.style = UIActivityIndicatorView.Style.gray
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.stopAnimating()
//
//        self.view.addSubview(activityIndicator)
//
//        // Hide Search
//        searchBar.resignFirstResponder()
//        dismiss(animated: true, completion: nil)
//
//        //Search Request
//        let searchRequest = MKLocalSearch.Request()
//        searchRequest.naturalLanguageQuery = searchBar.text
//
//        let activeSearch =  MKLocalSearch(request: searchRequest)
//        activeSearch.start { (response, error) in
//            activityIndicator.stopAnimating()
//            UIApplication.shared.endIgnoringInteractionEvents()
//            if response == nil
//            {
//                print("ERROR: Try Again")
//            }
//            else {
//                //Removing Annotations
//                let annotations = self.myMapView.annotations
//                self.myMapView.removeAnnotations(annotations)
//
//                //Getting Data
//                let latitude = response?.boundingRegion.center.latitude
//                let longitude = response?.boundingRegion.center.longitude
//
//                //Annotation
//                let annotation = MKPointAnnotation()
//                annotation.title = searchBar.text
//                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
//                self.myMapView.addAnnotation(annotation)
//
//                //Zoom In
//                let  coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
//
//            }
//        }
//
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureLocationManager()
//        configureMapView()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of aºººny resources that can be recreated.
//    }
//
//
//}
