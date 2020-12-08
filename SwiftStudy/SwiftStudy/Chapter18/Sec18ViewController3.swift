import UIKit

class Sec18ViewController3: UIViewController {
    
    private let firstText = "文字を入力してください"
    let fileOperator = FileOperator()
    
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

class FileOperator {
    
    // テキストファイルのパスを指定
    let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    
    func save(text: String) {
        // テキストデータの保存をトライする
        do {
            try text.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    func read() -> String {
        // テキストデータの読み込みをトライする
        do {
            let readText = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            return readText
        } catch let error as NSError {
            return "読み込みに失敗。\n \(error)"
        }
    }
}
