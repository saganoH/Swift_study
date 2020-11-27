import UIKit

class Sec15ViewController: UIViewController {
    
    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(
            timeInterval: 0.1, // 繰り返す時間(s)
            target: self,
            selector: #selector(self.step),
            userInfo: nil,
            repeats: true // リピート再生する
        )
    }
    
    // タイマーから定期的に呼び出されるメソッド
    @objc func step() {
        // 水平方向へ移動
        car.center.x += 10
        // 右辺から外へ出たら
        let carWidth = car.bounds.width
        if car.center.x > (view.bounds.width + carWidth/2) {
            // 左辺の手前へ戻す
            car.center.x = -carWidth
            // y座標はランダムな高さに変更
            let viewHeight = view.bounds.height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewHeight)))
        }
    }
}
