import UIKit
import MapKit

class Sec19ViewController5: UIViewController {
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var toolBar: UIToolbar!
    var toolbarDefaultColor: UIColor!
    
    override func viewWillAppear(_ animated: Bool) {
        toolbarDefaultColor = toolBar.tintColor
        // スケールを表示
        myMap.showsScale = true
        myMap.mapType = .standard
    }
  
    // MARK: - @IBAction
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToSapporo(_ sender: Any) {
        let sapporoStation: (ido: Double, keido: Double) = (43.068564, 141.3507138)
        let mapCenter = CLLocationCoordinate2D(latitude: sapporoStation.ido, longitude: sapporoStation.keido)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        // 表示する領域
        let mapRegion = MKCoordinateRegion(center: mapCenter, span: mapSpan)
        // 領域の地図を表示する
        myMap.setRegion(mapRegion, animated: true)
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            myMap.mapType = .standard
            myMap.camera.pitch = 0.0
            toolBar.tintColor = toolbarDefaultColor
            toolBar.alpha = 1.0
        case 1:
            myMap.mapType = .satellite
            toolBar.tintColor = UIColor.black
            toolBar.alpha = 0.8
        case 2:
            myMap.mapType = .hybrid
            toolBar.tintColor = UIColor.black
            toolBar.alpha = 0.8
        case 3:
            myMap.mapType = .standard
            toolBar.tintColor = toolbarDefaultColor
            toolBar.alpha = 1.0
            // 3Dビュー
            myMap.camera.pitch = 70 // 見下ろす角度
            myMap.camera.altitude = 700 // 標高
        default:
            break
        }
    }
}
