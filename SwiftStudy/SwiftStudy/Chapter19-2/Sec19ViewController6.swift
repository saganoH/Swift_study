import UIKit
import MapKit
import CoreLocation

class Sec19ViewController6: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var trackingButton: UIBarButtonItem!
    
    var locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapTrackingButton(_ sender: UIBarButtonItem) {
        switch myMap.userTrackingMode {
        case .none:
            myMap.setUserTrackingMode(.follow, animated: true)
            trackingButton.image = UIImage.
        }
    }
}
