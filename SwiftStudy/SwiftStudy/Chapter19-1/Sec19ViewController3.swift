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
        
        setupInputOutput()
        setPreviewLayer()
        session.startRunning()
        
        // デバイスが回転した時に通知するイベントハンドラを設定する
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.changedDeviceOrientation(_:)),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }
    @IBAction func takePhoto(_ sender: Any) {
        let captureSetting = AVCapturePhotoSettings()
        captureSetting.flashMode = .auto
        // captureSetting.isAutoStillImageStabilizationEnabled = true
        captureSetting.isHighResolutionPhotoEnabled = false
        // キャプチャのイメージ処理はデリゲートに任せる
        photoOutputObj.capturePhoto(with: captureSetting, delegate: self)
    }
    
    @objc func changedDeviceOrientation(_ notification: Notification) {
        // 回転向きとデバイスを合わせる
        if let photoOutputConnenction = self.photoOutputObj.connection(with: AVMediaType.video) {
            switch UIDevice.current.orientation {
            case .portrait:
                photoOutputConnenction.videoOrientation = .portrait
            case .portraitUpsideDown:
                photoOutputConnenction.videoOrientation = .portraitUpsideDown
            case .landscapeLeft:
                photoOutputConnenction.videoOrientation = .landscapeRight
            case .landscapeRight:
                photoOutputConnenction.videoOrientation = .landscapeLeft
            default:
                break
            }
        }
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
        // プレビューレイヤを作る
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.masksToBounds = true
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        // previewViewに追加する
        previewView.layer.addSublayer(previewLayer)
    }
}
