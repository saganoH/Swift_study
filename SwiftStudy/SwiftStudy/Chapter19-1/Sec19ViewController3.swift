import UIKit
import AVFoundation
import Photos

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

class Sec19ViewController3: UIViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var shutterButton: UIButton!
    
    private var session = AVCaptureSession()
    private var photoOutputObj = AVCapturePhotoOutput()
    private var shareImage: UIImage?
    
    private var authStatus: AuthorizedStatus = .authorized
    // 認証のステータス
    enum AuthorizedStatus {
        case authorized
        case notAuthorized
        case failed
    }
    
    // MARK: - life cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // セッション実行中ならば中断する
        if session.isRunning {
            return
        }
        // カメラのプライバシー認証確認
        cameraAuth()
        
        if authStatus == .authorized {
            setupInputOutput()
            setPreviewLayer()
            session.startRunning()
            shutterButton.isEnabled = true
        } else {
            showAlert(appName: "カメラ")
        }
        
        // デバイスが回転した時に通知するイベントハンドラを設定する
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.changedDeviceOrientation(_:)),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }
    
    // MARK: - @IBAction
    
    @IBAction func takePhoto(_ sender: Any) {
        if authStatus == .authorized {
            let captureSetting = AVCapturePhotoSettings()
            captureSetting.flashMode = .auto
            captureSetting.isHighResolutionPhotoEnabled = false
            // キャプチャのイメージ処理はデリゲートに任せる
            photoOutputObj.capturePhoto(with: captureSetting, delegate: self)
        } else {
            // カメラの利用を許可していない状態でシャッターボタンをタップした場合
            showAlert(appName: "カメラ")
        }
    }
    
    @IBAction func shareAction(_ sender: Any) {
        guard let shareImage = shareImage else {
            return
        }
        let sharedText = "撮影した画像をシェアします。"
        let sharedUrl = "http://oshige.com"
        let activities = [sharedText, sharedUrl, shareImage] as [Any]
        // アクティビティコントローラを表示する
        let activityVC = UIActivityViewController(activityItems: activities, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
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
    
    private func cameraAuth() {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .notDetermined:
            // 初回起動時
            AVCaptureDevice.requestAccess(for: AVMediaType.video,
                                          completionHandler: { [unowned self] authorized in
                                            print("初回", authorized.description)
                                            if authorized {
                                                self.authStatus = .authorized
                                            } else {
                                                self.authStatus = .notAuthorized
                                            }
                                          })
        case .restricted, .denied:
            authStatus = .notAuthorized
        case .authorized:
            authStatus = .authorized
        @unknown default:
            authStatus = .failed
        }
    }
    
    private func showAlert(appName: String) {
        let alertTitle = appName + "のプライバシー認証"
        let alertMessage = "設定＞プライバシー＞" + appName + "で利用を許可してください。"
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        // 設定を開くボタン
        alert.addAction(
            UIAlertAction(title: "設定を開く",
                          style: .default,
                          handler: { action in UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                                                         options: [:],
                                                                         completionHandler: nil)
                          })
        )
        // アラートを表示する
        self.present(alert, animated: false, completion: nil)
    }
}
