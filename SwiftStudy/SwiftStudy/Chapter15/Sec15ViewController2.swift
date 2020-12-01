import UIKit

class Sec15ViewController2: UIViewController {
    
    @IBOutlet weak var azarashi: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func comeHome15_2(segue: UIStoryboardSegue) {
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        
        // 指定した最終値になるようにアニメーションする
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: {
                self.azarashi.center = tapPoint
            },
            completion: nil
        )
    }
}
