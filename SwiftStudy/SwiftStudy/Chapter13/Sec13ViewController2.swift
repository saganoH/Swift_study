import UIKit

class Sec13ViewController2: UIViewController {
    
    // このビューコントローラに戻ってくる
    @IBAction func comeSec13view2(segue: UIStoryboardSegue) {
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.green
        
        // イメージビューを作る
        let rect = CGRect(x: 0, y: 0, width: 300, height: 200)
        let imageView = UIImageView(frame: rect)
        
        // イメージの表示モード
        imageView.contentMode = .scaleAspectFit
        // イメージビューにイメージを認定する
        imageView.image = UIImage(named: "nakajimaPark")
        // イメージビューの座標をルートビューの中央に設定する
        imageView.center = self.view.center
        
        // アイコン画像のビューを作成
        let cameraImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cameraImage.image = UIImage(named: "cameraMark")
        // 画像を縮小して全体を表示する
        cameraImage.contentMode = .scaleAspectFit
        // imageViewの中での座標
        cameraImage.center = CGPoint(x: 280, y: 100)
        
        // imageViewのサブビューにする
        imageView.addSubview(cameraImage)
        // サブビューをクリップして表示する
        imageView.clipsToBounds = true
        
        // イメージビューをルートビューに表示する
        self.view.addSubview(imageView)
    }
}
