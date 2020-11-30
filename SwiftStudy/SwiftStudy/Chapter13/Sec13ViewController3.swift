import UIKit

class Sec13ViewController3: UIViewController {
    
    // このビューコントローラに戻ってくる
    @IBAction func comeSec13view3(segue: UIStoryboardSegue) {
    }

    @IBOutlet weak var myCar: UIImageView!
    // 車のホーム座標を決める
    let homePoint = CGPoint(x: 350, y: 150)
    
    // ホームに戻る
    @IBAction func goHome(_ sender: Any) {
        myCar.center = homePoint
    }
    
    // 左へ進む
    @IBAction func move(_ sender: Any) {
        myCar.center.x -= 10
    }
    
    override func viewDidLayoutSubviews() {
        myCar.center = homePoint
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
