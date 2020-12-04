import UIKit

class Sec18ViewController3: UIViewController {
    
    @IBOutlet weak var textView1: UITextView! {
        didSet {
            textView1.text = "文字を入力してください"
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
    
    // テキストファイルのパスを指定
    let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"

    @IBAction func saveToFile(_ sender: Any) {
        // 保存するテキストデータ
        let textData = textView1.text
        // テキストデータの保存をトライする
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    @IBAction func readFromFile(_ sender: Any) {
        // テキストデータの読み込みをトライする
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            // 読み込みが成功したら表示する
            textView2.text = textData
        } catch let error as NSError {
            textView2.text = "読み込みに失敗。\n \(error)"
        }
    }
    
    @IBAction func comeHome18_3(segue: UIStoryboardSegue) {
    }
}
