import UIKit
import AVFoundation

class Sec19ViewController3: UIViewController {
    
    override var shouldAutorotate: Bool {
        // オートローテーションを許可する
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        //縦向きだけを許可する
        return .portrait
    }
    
    @IBOutlet weak var previewView: UIView!
    
    var session = AVCaptureSession()
    var photoOutputObj = AVCapturePhotoOutput()

    override func viewWillAppear(_ animated: Bool) {
        // セッション実行中ならば中断する
        if session.isRunning {
            return
        }
        // 入出力の設定
        setupInputOutput()
        // プレビューレイヤの設定
        setPreviewLayer()
        // セッション開始
        session.startRunning()
    }
    @IBAction func takePhoto(_ sender: Any) {
    }
    
    func setupInputOutput() {
        // 解像度の指定
        session.sessionPreset = AVCaptureSession.Preset.photo
        // 入力の設定
        do {
            // デバイスの取得
            let device = AVCaptureDevice.default(
                AVCaptureDevice.DeviceType.builtInWideAngleCamera,
                for: AVMediaType.video,
                position: AVCaptureDevice.Position.back)
            // 入力元
            let input = try AVCaptureDeviceInput(device: device!)
            if session.canAddInput(input) {
                session.addInput(input)
            } else {
                print("セッションに入力を追加できなかった")
                return
            }
        } catch let error as NSError {
            print("カメラがない \(error)")
            return
        }
        
        // 出力の設定
        if session.canAddOutput(photoOutputObj) {
            session.addOutput(photoOutputObj)
        } else {
            print("セッションに出力を追加できなかった")
            return
        }
    }
    
    func setPreviewLayer() {
        
    }
}
