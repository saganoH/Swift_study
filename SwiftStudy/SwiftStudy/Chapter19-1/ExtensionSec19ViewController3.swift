import Photos
import UIKit

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
