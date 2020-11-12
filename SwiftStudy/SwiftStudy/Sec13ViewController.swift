import UIKit

class Sec13ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //ビューを作る
        let theView = UIView()
        //ビューの領域と背景色
        theView.frame = CGRect(x: 60, y: 100, width: 210, height: 200)
        theView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.6, alpha: 1.0)
        
        //ラベルを作る
        let labelA = UILabel()
        labelA.text = "ラベルA"
        //ラベルの領域
        labelA.frame = CGRect(x: 50, y: 60, width: 110, height: 21)
        //背景色と文字色
        labelA.backgroundColor = UIColor.orange
        labelA.textColor = UIColor.white
        
        //ラベルをビューに追加する
        theView.addSubview(labelA)
        self.view.addSubview(theView)
    }
}
