import UIKit

class Sec18ViewController3: UIViewController {
    
    @IBOutlet weak var textView1: UITextView! {
        didSet {
            textView1.text = firstText
            textView1.layer.borderColor = UIColor.black.cgColor
            textView1.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var textView2: UITextView! {
        didSet {
            textView2.text = ""
            textView2.layer.borderColor = UIColor.black.cgColor
            textView2.layer.borderWidth = 1.0
        }
    }
    
    private let firstText = "文字を入力してください"
    private let fileOperator = FileOperator(filePath: "/Documents/myTextfile.txt")

    override func viewDidAppear(_ animated: Bool) {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(Sec18ViewController3.keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @IBAction func saveToFile(_ sender: Any) {
        fileOperator.save(text: textView1.text)
        view.endEditing(true)
    }
    
    @IBAction func readFromFile(_ sender: Any) {
        textView2.text = fileOperator.read()
    }
    
    @IBAction func comeHome18_3(segue: UIStoryboardSegue) {
    }
    
    // キーボードが表示された時実行
    @objc func keyboardDidShow(_ notification: Notification) {
        if textView1.text == firstText {
            // 初期値の文字を消す
            textView1.text = ""
        }
    }
}
