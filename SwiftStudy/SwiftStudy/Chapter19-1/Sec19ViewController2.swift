import UIKit

class Sec19ViewController2: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(changedDeviceOrientation(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changedDeviceOrientation(_ notification: Notification) {
        // デバイスの向きを調べる
        switch UIDevice.current.orientation {
        case .portrait:
            // ラベルを0度回転
            rotateLabel(0)
        case .portraitUpsideDown:
            // ラベルを180度回転
            rotateLabel(CGFloat(Double.pi))
        case .landscapeLeft:
            rotateLabel(CGFloat(Double.pi/2))
        case .landscapeRight:
            rotateLabel(CGFloat(-Double.pi/2))
        default:
            break
        }
    }
    
    private func rotateLabel(_ radian: CGFloat) {
        label1.transform = CGAffineTransform(rotationAngle: radian)
        label2.transform = CGAffineTransform(rotationAngle: radian)
        label3.transform = CGAffineTransform(rotationAngle: radian)
        label4.transform = CGAffineTransform(rotationAngle: radian)
    }
}
