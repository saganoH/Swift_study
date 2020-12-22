import UIKit
import MapKit
import CoreLocation

class Sec19ViewController6: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var trackingButton: UIBarButtonItem!
    
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myMap.delegate = self
        myMap.showsScale = true
        locationManager.delegate = self
    }
    
    // MARK: - @IBAction
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapTrackingButton(_ sender: UIBarButtonItem) {
        switch myMap.userTrackingMode {
        case .none:
            myMap.setUserTrackingMode(.follow, animated: true)
            trackingButton.image = UIImage(systemName: "location.fill")
        case .follow:
            myMap.setUserTrackingMode(.followWithHeading, animated: true)
            trackingButton.image = UIImage(systemName: "location.north.line.fill")
        case .followWithHeading:
            myMap.setUserTrackingMode(.none, animated: true)
            trackingButton.image = UIImage(systemName: "location")
        @unknown default:
            myMap.setUserTrackingMode(.none, animated: false)
        }
    }
   
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        trackingButton.image = UIImage(systemName: "location")
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            trackingButton.isEnabled = true
        default:
            locationManager.stopUpdatingLocation()
            myMap.setUserTrackingMode(.none, animated: true)
            trackingButton.image = UIImage(systemName: "location")
            trackingButton.isEnabled = false
        }
    }
}
