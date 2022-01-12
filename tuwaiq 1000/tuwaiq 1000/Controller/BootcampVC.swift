//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
import UIKit
import MapKit

class VC2 : UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    let centerMapButton: UIButton = {
        
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
        
        return button
    }()
    @IBOutlet weak var myMapView: MKMapView!
    var selectedpro : Item?

    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var Name2: UILabel!
    @IBOutlet weak var Image1: UIImageView!


    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        Image1.layer.cornerRadius = 27
        Image1.clipsToBounds = true
        if selectedpro != nil{
            Name2.text = selectedpro?.name
            price2.text = selectedpro?.price1
            labels.text = selectedpro?.spe
            Image1.image = selectedpro!.logo
            Image1.layer.cornerRadius = 27
            Image1.clipsToBounds = true
            configureLocationManager()
            configureMapView()
           
    }

}
}
extension VC2 {
   
    @objc func handleCenterLocation() {
        centerMapOnUserLocation()
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else { return }
    }
    
  
   
    
   
    func configureMapView() {
        
        mapView = MKMapView()
        
        let m1 = MKPointAnnotation()
        m1.title = "Tuwaiq 1000 Bootcamp"
        m1.coordinate = CLLocationCoordinate2D(latitude: 18.2497564,
                                               longitude: 42.5567473)
        myMapView.addAnnotation(m1)
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //ActivityIndicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
        self.view.addSubview(activityIndicator)
        
        // Hide Search
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Search Request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch =  MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if response == nil
            {
                print("ERROR: Try Again")
            }
            else {
                //Removing Annotations
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
                //Getting Data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMapView.addAnnotation(annotation)
                
                //Zoom In
                let  coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                
            }
        }
        
        
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureLocationManager()
//        configureMapView()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of aºººny resources that can be recreated.
    }
    
    
}

