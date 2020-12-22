import UIKit
import MapKit

class Sec19ViewController7: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    private var annotationlist = Array<MKPointAnnotation>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMap.delegate = self
        
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
    
    // MARK: - @IBAction
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mapLongPress(_ sender: UILongPressGestureRecognizer) {
        // 長押しの終了でのみ実行する
        guard sender.state == UIGestureRecognizer.State.ended else {
            return
        }
        // 長押しした座標を取り出す
        let pressPoint = sender.location(in: myMap)
        // マップの座標に変換
        let pressCoodinate = myMap.convert(pressPoint, toCoordinateFrom: myMap)
        let annotation = MKPointAnnotation()
        annotation.coordinate = pressCoodinate
        annotation.title = "ここ！"
        annotationlist.append(annotation)
        myMap.addAnnotation(annotation)
    }
    
    @IBAction func removeLastPin(_ sender: Any) {
        // 最後に追加したピンを削除する
        if annotationlist.count > 0 {
            myMap.removeAnnotation(annotationlist.removeLast())
        }
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // ピンをカスタマイズする
        let pinView = MKPinAnnotationView()
        pinView.animatesDrop = true
        pinView.isDraggable = true
        pinView.pinTintColor = UIColor.blue
        pinView.canShowCallout = true
        return pinView
    }
}
