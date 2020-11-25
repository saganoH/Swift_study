import UIKit

class Sec14ViewController: UIViewController {
    
    @IBAction func backToHome(_ sender: Any) {
        // 現在のシーンを閉じて元のシーンに戻る
        self.dismiss(animated: true, completion: nil)
    }
}
