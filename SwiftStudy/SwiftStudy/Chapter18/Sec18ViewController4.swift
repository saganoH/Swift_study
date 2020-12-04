import UIKit

class Sec18ViewController4: UIViewController {
    
    @IBOutlet weak var myTextView: UITextView! {
        didSet {
            myTextView.text = ""
        }
    }
    // テキストファイルのパス
    private let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    private var originalFrame: CGRect?

    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        // テキストビューの元のframeを保存する
        originalFrame = myTextView.frame
        
        // ファイルから読み込む
        readFromFile()
        
        // 通知センターのオプションを作る
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(Sec18ViewController4.keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(Sec18ViewController4.keyboardChangeFrame(_:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        notification.addObserver(self, selector: #selector(Sec18ViewController4.keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        // ツールバー生成 サイズはsizeToFitメソッドで自動で調整される。
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //サイズの自動調整。
        toolBar.sizeToFit()
        
        // Cancelボタン
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancel(_:)))
        // 左側のBarButtonItemはflexibleSpace。
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // saveボタン
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save(_:)))
        // BarButtonItemの配置
        toolBar.items = [cancelButton, spacer, saveButton]
        // textViewのキーボードにツールバーを設定
        myTextView.inputAccessoryView = toolBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    // MARK: - @IBAction
    
    @IBAction func cancel(_ sender: Any) {
        view.endEditing(true)
        readFromFile()
    }
    
    @IBAction func save(_ sender: Any) {
        view.endEditing(true)
        
        let textData = myTextView.text
        // テキストデータの保存をトライする
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    // MARK: - @objc
    
    // キーボードが表示された時実行
    @objc func keyboardDidShow(_ notification: Notification) {
        // keyboardChangeFrameで処理する
    }
    
    // キーボードのサイズが変化した
    @objc func keyboardChangeFrame(_ notification: Notification) {
        // キーボードのframeを調べる
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // キーボードで隠れないようにテキストビューの高さを変更する
        var textViewFrame = myTextView.frame
        textViewFrame.size.height = keyboardFrame.minY - textViewFrame.minY - 5
        myTextView.frame = textViewFrame
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        // テキストビューのサイズを戻す
        myTextView.frame = originalFrame!
    }
    
    // MARK: - private

    // ファイルからの読み込み
    private func readFromFile() {
        // テキストデータの読み込みをトライする
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            // 成功したら表示する
            myTextView.text = textData
        } catch let error as NSError {
            print("読み込みに失敗。\n \(error)")
        }
    }
}
