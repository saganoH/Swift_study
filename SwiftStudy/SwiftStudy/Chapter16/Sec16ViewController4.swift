import UIKit

class Sec16ViewController4: UIViewController {
    
    @IBOutlet weak var usagi: UIImageView!
    // 最後の回転角度
    var lastRotation: CGFloat = 0.0
    
    @IBAction func rotateUsagi(_ sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .began:
            sender.rotation = lastRotation
        case .changed:
            // 回転角度にウサギを合わせる
            usagi.transform = CGAffineTransform(rotationAngle: sender.rotation)
        case .ended:
            lastRotation = sender.rotation
        default:
            break
        }
    }
}
