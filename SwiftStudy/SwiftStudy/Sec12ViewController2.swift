import UIKit

class Sec12ViewController2: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBAction func random(_ sender: Any) {
        //乱数を作る
        let num = arc4random_uniform(100)
        numLabel.text = String(num)
        
        okButton.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        //ボタンの有効・無効の設定
        okButton.isEnabled = (num >= 50)
    }
    
    @IBAction func tapOK(_ sender: Any) {
        print("OK")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
}
