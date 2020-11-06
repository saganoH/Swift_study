import UIKit

class Sec12ViewController: UIViewController {
    
    //このビューコントローラに戻ってくる
    @IBAction func comeSec12Top(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var myLabel: UILabel! {
        didSet {
            myLabel.textAlignment = .center
        }
    }
    
    @IBAction func hello(_ sender: Any) {
        myLabel.text = "こんにちは"
        myLabel.backgroundColor = .green
    }
    
    @IBAction func thankYou(_ sender: Any) {
        myLabel.text = "ありがとう"
        myLabel.backgroundColor = .red
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let myLabel2 = UILabel()
        myLabel2.text = "ハローワールド"
        myLabel2.frame = CGRect(x: 50, y: 100, width: 200, height: 21)
        myLabel2.textColor = UIColor.black
        myLabel2.backgroundColor = UIColor.lightGray
        myLabel2.textAlignment = .center
        
        view.addSubview(myLabel2)
    }
}
