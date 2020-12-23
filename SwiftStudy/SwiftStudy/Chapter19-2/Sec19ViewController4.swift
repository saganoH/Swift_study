import UIKit
import CoreLocation

class Sec19ViewController4: UIViewController, CLLocationManagerDelegate {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet weak var idoLabel: UILabel!
    @IBOutlet weak var keidoLabel: UILabel!
    @IBOutlet weak var hyoukouLabel: UILabel!
    
    @IBOutlet weak var henkakuLabel: UILabel!
    @IBOutlet weak var houiLabel: UILabel!
    @IBOutlet weak var jihokuSeg: UISegmentedControl!
    @IBOutlet weak var compass: UIImageView!
    
    // ロケーションマネージャを作る
    private var locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        disabledLocationLabel()
        // 位置情報の利用許可を得る
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        setupLocationService()
        startHeadingService()
    }
    
    // ロケーション機能の設定
    private func setupLocationService() {
        // ロケーションの精度を設定する
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 更新距離(m)
        locationManager.distanceFilter = 1
    }
    
    private func disabledLocationLabel() {
        let message = "位置情報の利用が許可されていない"
        idoLabel.text = message
        keidoLabel.text = message
        hyoukouLabel.text = message
    }
    
    private func startHeadingService() {
        // セグメンテッドコントロールで磁北を選択
        jihokuSeg.selectedSegmentIndex = 0
        // 自分が向いている方向をデバイスのポートレート向きにする
        locationManager.headingOrientation = .portrait
        // 向きが1度変わったらデリゲートメソッドを呼ぶ
        locationManager.headingFilter = 1
        // ヘディングの更新を開始する
        locationManager.startUpdatingHeading()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    // 位置情報利用許可のステータスが変わった場合
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            // ロケーションの更新を開始する
            locationManager.startUpdatingLocation()
        case .notDetermined:
            // ロケーションの更新を停止する
            locationManager.stopUpdatingLocation()
            disabledLocationLabel()
        default:
            // ロケーションの更新を停止する
            locationManager.stopUpdatingLocation()
            disabledLocationLabel()
        }
    }
    
    // 位置情報が更新された場合
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationData = locations.last
        
        if var ido = locationData?.coordinate.latitude {
            ido = round( (ido*1000000) / 1000000 )
            idoLabel.text = String(ido)
        }
        
        if var keido = locationData?.coordinate.longitude {
            keido = round( (keido*1000000) / 1000000 )
            keidoLabel.text = String(keido)
        }
        
        if var hyoukou = locationData?.altitude {
            hyoukou = round( (hyoukou*100) / 100 )
            hyoukouLabel.text = String(hyoukou) + "m"
        }
    }
    
    // 向いている方角が変わった
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let makita = newHeading.trueHeading
        let jihoku = newHeading.magneticHeading
        
        var henkaku = jihoku - makita
        if henkaku < 0 {
            henkaku = henkaku + 360
        }
        henkaku = round(henkaku*100) / 100
        henkakuLabel.text = String(henkaku)
        
        // 北の方角を設定
        var kitamuki: CLLocationDirection!
        if jihokuSeg.selectedSegmentIndex == 0 {
            kitamuki = jihoku
        } else {
            kitamuki = makita
        }
        
        // 磁針で北を指す
        compass.transform = CGAffineTransform(rotationAngle: CGFloat(-kitamuki * Double.pi/180))
        // デバイスが向いている方位角度
        let houikaku = round(kitamuki*100) / 100
        houiLabel.text = String(houikaku)
    }
}
