//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit
import CoreLocation
import MapKit

class MapVC: UIViewController {
  
  var locationManager: CLLocationManager!
  var mapView: MKMapView!
  //==========================================================================
  let centerMapButton: UIButton = {
    
    let button = UIButton()
    button.tintColor = .white
    button.backgroundColor = .systemBlue
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "location.fill"), for: .normal)
    button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
    
    return button
  }()
  //==========================================================================
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureLocationManager()
    configureMapView()
    enableLocationServices()
  }
  //==========================================================================
  @objc func handleCenterLocation() {
    centerMapOnUserLocation()
  }
  //==========================================================================
  func configureLocationManager() {
    locationManager = CLLocationManager()
    locationManager.delegate = self
  }
  //==========================================================================
  func configureMapView() {
    
    mapView = MKMapView()
    mapView.showsUserLocation = true
    mapView.delegate = self
    mapView.userTrackingMode = .follow
    
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    centerMapButton.layer.cornerRadius = 70 / 2
    view.addSubview(centerMapButton)
    NSLayoutConstraint.activate([
      
      centerMapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 135),
      centerMapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270),
      centerMapButton.widthAnchor.constraint(equalToConstant: 70),
      centerMapButton.heightAnchor.constraint(equalToConstant: 70),
    ])
    //========================================================================
    let m1 = MKPointAnnotation()
    m1.title = "Swift Bootcamp"
    m1.coordinate = CLLocationCoordinate2D(latitude: 18.2497564,
                                           longitude: 42.5567473)
    mapView.addAnnotation(m1)
    //========================================================================
   
  }
  
  func centerMapOnUserLocation() {
    guard let coordinate = locationManager.location?.coordinate else { return }
    let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
    mapView.setRegion(region, animated: true)
  }
}
//==========================================================================
extension MapVC: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    UIView.animate(withDuration: 0.5) {
      self.centerMapButton.alpha = 1
    }
  }
  
}
//==========================================================================
extension MapVC: CLLocationManagerDelegate {
  
  func enableLocationServices() {
    
    switch CLLocationManager.authorizationStatus() {
      
    case .notDetermined:
      print("Location auth status is NOT DETERMINED")
      locationManager.requestWhenInUseAuthorization()
      
    case .restricted:
      print("Location auth status is RESTRICTED")
      
    case .denied:
      print("Location auth status is DENIED")
      
    case .authorizedAlways:
      print("Location auth status is AUTHORIZED ALWAYS")
      
    case .authorizedWhenInUse:
      print("Location auth status is AUTHORIZED WHEN IN USE")
      locationManager.startUpdatingLocation()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
  }
  //==========================================================================
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard locationManager.location != nil else { return }
    centerMapOnUserLocation()
  }
}
//==========================================================================
