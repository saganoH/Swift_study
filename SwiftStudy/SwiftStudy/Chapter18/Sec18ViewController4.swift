import UIKit

class Sec18ViewController4: UIViewController {
   
    @IBOutlet weak var myTextView: UITextView! {
        didSet {
            myTextView.text = ""
            myTextView.layer.borderColor = UIColor.black.cgColor
            myTextView.layer.borderWidth = 1.0
        }
    }
    // テキストファイルのパス
    private let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    private var originalFrame: CGRect?
    
    
    
}
