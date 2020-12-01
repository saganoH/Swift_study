import UIKit

class Sec15ViewController3: UIViewController {
    
    @IBAction func comeHome15_3(segue: UIStoryboardSegue) {
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // flowerを作る
        let flower = UIImageView(image: UIImage(named: "flower"))
        // 透明度を0にし、消しておく
        flower.alpha = 0
        
        // 0.2倍サイズにする
        let scaleTransform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        // -π/2回転する
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        // トランスフォームを足し合わせる
        let transform = scaleTransform.concatenating(rotationTransform)
        // flowerを変形させる
        flower.transform = transform
        
        // タップした座標にflowerを表示させる
        flower.center = sender.location(in: view)
        view.addSubview(flower)
        
        // 表示したflowerのアニメーション
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                // 透明度を1にする
                flower.alpha = 1
                // 変形を戻す
                flower.transform = .identity
            },
            completion: { (finished: Bool) in
                //フェードインが完了したら続けて実行する
                self.fadeoutAndRemove(flower)
            }
        )
    }
    
    // フェードアウトが完了したら取り除く
    func fadeoutAndRemove(_ view: UIView) {
        // フェードアウトする
        UIView.animate(
            withDuration: 1.0,
            delay: 3.0,
            options: UIView.AnimationOptions(),
            animations: {
                // 消える
                view.alpha = 0
            },
            completion: { (finished: Bool) in
                // ビューから取り除く
                view.removeFromSuperview()
            }
        )
    }
}
