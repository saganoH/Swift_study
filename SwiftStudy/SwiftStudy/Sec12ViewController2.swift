import UIKit

class Sec12ViewController2: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBAction func random(_ sender: Any) {
        //乱数を作る
        let num = arc4random_uniform(100)
        numLabel.text = String(num)
        //ボタンの有効・無効の設定
        okButton.isEnabled = (num >= 50)
    }
    
    @IBAction func tapOK(_ sender: Any) {
        print("OK")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        okButton.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        
        //ノーマル・ハイライトの画像の設定
        let myButton = UIButton(type: .custom)
        myButton.frame = CGRect(x: 120, y: 200, width: 70, height: 70)
        
        let image1 = UIImage(named: "btnNormal")
        let image2 = UIImage(named: "btnHighlighted")
        myButton.setImage(image1, for: .normal)
        myButton.setImage(image2, for: .highlighted)
    
        self.view.addSubview(myButton)
    }
}
