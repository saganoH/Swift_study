import UIKit

class Sec16ViewController3: UIViewController {
    
    var kakudo: CGFloat = 180.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 最初の色を設定する
        view.backgroundColor = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    @IBAction func dragColor(_ sender: UIPanGestureRecognizer) {
        // ドラッグした量を取得
        let translation = sender.translation(in: view)
        if translation.x > 0 {
            // 右へドラッグしたら色相環を右回り
            kakudo -= 1.0
        } else {
            // 左へドラッグしたら色相環を左回り
            kakudo += 1.0
        }
        
        // 色相感を循環する
        if kakudo < 0 {
            kakudo += 360
        } else if kakudo > 360 {
            kakudo -= 360
        }
        
        // ビューの背景色を変更する
        let color = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        view.backgroundColor = color
    }
    
    @IBAction func comeHome16_3(segue: UIStoryboardSegue) {
    }
}
