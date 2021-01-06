import UIKit

class savePhotoSample: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
    }
    
    @IBAction func savePhoto(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            //タップしたUIImageViewを取得
            let targetImageView = sender.view! as! UIImageView
            // その中の UIImage を取得
            let targetImage = targetImageView.image!
            
            //保存するか否かのアラート
            let alertController = UIAlertController(title: "保存", message: "この画像を保存しますか？", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default) { (ok) in
                //フォトライブラリに画像を保存
                UIImageWriteToSavedPhotosAlbum(targetImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
            }

            let cancelAction = UIAlertAction(title: "CANCEL", style: .default) { (cancel) in
                alertController.dismiss(animated: true, completion: nil)
            }
            //OKとCANCELをアラートに追加し、表示
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc private func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // OKボタンを追加
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        // アラートを表示
        self.present(alert, animated: true, completion: nil)
    }
}
