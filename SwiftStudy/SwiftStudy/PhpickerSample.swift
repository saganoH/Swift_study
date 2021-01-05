import UIKit
import PhotosUI

// PHPickerの使い方テスト
class PhpickerSample: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pickerの設定
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())

        // Pickerで選択するメディアの種類をフィルタリング
        config.filter = .images // videos, livePhotos

        // 選択できる数を指定
        config.selectionLimit = 1

        // configを渡して初期化
        let controller = PHPickerViewController(configuration: config)

        // delegateをセット
        controller.delegate = self

        // 表示
        present(controller, animated: true)
    }
}

extension PhpickerSample: PHPickerViewControllerDelegate {
    // Pickerを閉じたときに呼ばれる
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        // PHPickerResultからImageを読み込む
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    if let image = image as? UIImage {
                        // 選択されたimageを表示
                        self.imageView.image = image
                    }
                } 
            }
        }
    }
}
