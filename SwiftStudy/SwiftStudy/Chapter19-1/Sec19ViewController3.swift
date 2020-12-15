import UIKit
import Photos

class Sec19ViewController3: UIViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var shutterButton: UIBarButtonItem!
    
    private var session = AVCaptureSession()
    private var photoOutputObj = AVCapturePhotoOutput()
    private var shareImage: UIImage?
    private var presenter = CameraPresenter()
    
    
    // MARK: - life cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // セッション実行中ならば中断する
        if session.isRunning {
            return
        }
        presenter.delegate = self
        presenter.didAppear()

        // デバイスが回転した時に通知するイベントハンドラを設定する
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.changedDeviceOrientation(_:)),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }
    
    // MARK: - @IBAction
    
    @IBAction func takePhoto(_ sender: Any) {
        presenter.takePhoto()
    }
    
    @IBAction func shareAction(_ sender: Any) {
        guard let shareImage = shareImage else {
            return
        }
        presenter.shareImage(shareImage: shareImage)
    }
    
    // MARK: - @objc
    
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
    
    // MARK: - private
    
    private func setupInputOutput() {
        // 解像度の指定
        session.sessionPreset = AVCaptureSession.Preset.photo
        // 入力の設定
        do {
            // デバイスの取得
            let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera,
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
    
    private func setPreviewLayer() {
        // プレビューレイヤを作る
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.masksToBounds = true
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        // previewViewに追加する
        previewView.layer.addSublayer(previewLayer)
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension Sec19ViewController3: AVCapturePhotoCaptureDelegate {
    // 映像をキャプチャする
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        // Dataを取り出す
        guard let photoData = photo.fileDataRepresentation() else {
            return
        }
        
        // Dataから写真イメージを作る
        if let stillImage = UIImage(data: photoData) {
            // アルバムに追加する
            UIImageWriteToSavedPhotosAlbum(stillImage, self, nil, nil)
            shareImage = stillImage
        }
    }
}

// MARK: - PresenterDelegate

protocol PresenterDelegate {
    func showAlert(alertVc: UIAlertController)
    func canUseCamera()
    func canTakePhoto(setting: AVCapturePhotoSettings)
    func canSharePhoto(activityVC: UIActivityViewController)
}

extension Sec19ViewController3: PresenterDelegate {
    
    func showAlert(alertVc: UIAlertController) {
        self.present(alertVc, animated: false, completion: nil)
    }
    
    func canUseCamera() {
        setupInputOutput()
        setPreviewLayer()
        session.startRunning()
        shutterButton.isEnabled = true
    }
    
    func canTakePhoto(setting: AVCapturePhotoSettings) {
        photoOutputObj.capturePhoto(with: setting, delegate: self)
    }
    
    func canSharePhoto(activityVC: UIActivityViewController) {
        self.present(activityVC, animated: true, completion: nil)
    }
}

