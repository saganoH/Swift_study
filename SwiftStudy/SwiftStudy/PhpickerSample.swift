import UIKit
import PhotosUI

// PHPickerの使い方テスト
class PhpickerSample: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var itemProviders: [NSItemProvider] = []
    var iterator: IndexingIterator<[NSItemProvider]>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pickerの設定
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())

        // Pickerで選択するメディアの種類をフィルタリング
        config.filter = .images // videos, livePhotos

        // 選択できる数を指定
        config.selectionLimit = 0

        // configを渡して初期化
        let controller = PHPickerViewController(configuration: config)

        // delegateをセット
        controller.delegate = self

        // 表示
        present(controller, animated: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayNextImage()
    }
    
    private func displayNextImage() {
        if let itemProvider = iterator?.next(), itemProvider.canLoadObject(ofClass: UIImage.self) {
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

extension PhpickerSample: PHPickerViewControllerDelegate {
    // Pickerを閉じたときに呼ばれる
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        itemProviders = results.map(\.itemProvider)
        iterator = itemProviders.makeIterator()
        displayNextImage()
    }
}
