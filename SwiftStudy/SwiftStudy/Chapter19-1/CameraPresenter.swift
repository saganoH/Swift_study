import UIKit
import AVFoundation

class CameraPresenter {
    
    var delegate: PresenterDelegate?
    private let auth = CameraAuth()
    
    func didAppear() {
        auth.authorize(completion: { status in
            if status == .authorized {
                self.delegate?.canUseCamera()
            } else {
                let alert = self.createAlert(appName: "カメラ")
                self.delegate?.showAlert(alertVc: alert)
            }
        })
    }
    
    func takePhoto() {
        if auth.status == .authorized {
            let captureSetting = AVCapturePhotoSettings()
            captureSetting.flashMode = .auto
            captureSetting.isHighResolutionPhotoEnabled = false
            
        } else {
            // カメラの利用を許可していない状態でシャッターボタンをタップした場合
            let alert = self.createAlert(appName: "カメラ")
            self.delegate?.showAlert(alertVc: alert)
        }
    }
    
    func shareImage(shareImage: UIImage) {
        let sharedText = "撮影した画像をシェアします。"
        let sharedUrl = "http://oshige.com"
        let activities = [sharedText, sharedUrl, shareImage] as [Any]
        // アクティビティコントローラを表示する
        let activityVC = UIActivityViewController(activityItems: activities, applicationActivities: nil)
        self.delegate?.canSharePhoto(activityVC: activityVC)
    }
    
    func createAlert(appName: String) -> UIAlertController {
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
        return alert
    }
}
