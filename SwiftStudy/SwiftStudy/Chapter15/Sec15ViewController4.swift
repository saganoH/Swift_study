import UIKit

class Sec15ViewController4: UIViewController {
    
    @IBOutlet weak var usagiView: UIImageView!
    
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // スライダの範囲を決める
        mySlider.minimumValue = 0.0
        mySlider.maximumValue = 5.0
        // スライダの開始意図を0にする
        mySlider.value = 0.0
        // 再生するイメージの配列を設定する
        usagiView.animationImages = usagiImages()
        // 無限ループ再生にする
        usagiView.animationRepeatCount = 0
    }
    
    @IBAction func runSpeed(_ sender: UISlider) {
        // スライダーの値が0の時止める
        if sender.value == 0 {
            // アニメーションをストップする
            usagiView.stopAnimating()
            // イメージを変える
            usagiView.image = UIImage(named: "slow")
        } else {
            // 再生秒数をスライダで決める
            let sec = sender.maximumValue - sender.value
            // 再生にかかる秒数を設定する
            usagiView.animationDuration = TimeInterval(sec)
            // アニメーションが止まっているなら再生する
            if !usagiView.isAnimating {
                usagiView.startAnimating()
            }
        }
    }
    
    // コマ送りのイメージの配列を作る
    func usagiImages ()  -> Array<UIImage> {
        var theArray = [UIImage]()
        for num in 1...5 {
            // コマ送りのイメージを作る
            let imageName = "usagi_" + String(num)
            let image = UIImage(named: imageName)
            // 配列に追加
            if let image = image {
                theArray.append(image)
            }
        }
        return theArray
    }
}
