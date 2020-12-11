import UIKit

class Sec19ViewController: UIViewController {
    
    override var shouldAutorotate: Bool {
        // オートローテーションを許可する
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        //横向きだけを許可する
        return .landscape
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
