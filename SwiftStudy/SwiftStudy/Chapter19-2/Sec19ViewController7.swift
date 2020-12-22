import UIKit
import MapKit

class Sec19ViewController7: UIViewController {
    
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 横浜中華街の座標を作る
        let chinaTownCenter = CLLocationCoordinate2D(latitude: 35.4424225, longitude: 139.6465645)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let chinaTownRegion = MKCoordinateRegion(center: chinaTownCenter, span: span)
        myMap.setRegion(chinaTownRegion, animated: true)
        
        // アノテーションを作る
        let annotation = MKPointAnnotation()
        annotation.coordinate = chinaTownCenter
        annotation.title = "中華街"
        annotation.subtitle = "待ち合わせ場所"
        myMap.addAnnotation(annotation)
    }
}
