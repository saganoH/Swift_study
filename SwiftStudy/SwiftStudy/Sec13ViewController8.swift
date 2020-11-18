import UIKit

class Sec13ViewController8: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    // 全てのテキストフィールド
    @IBOutlet var myTextField: [UITextField]!
    
    // 編集中のテキストフィールド
    var editingField: UITextField?
    
    // 編集開始
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editingField = textField
    }
    
    // 編集終了
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingField = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールビューの領域を指定する
        let scrollFrame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height-20)
        scrollView.frame = scrollFrame
        // コンテンツのサイズを指定する
        let contentRect = contentView.bounds
        scrollView.contentSize = CGSize(width: contentRect.width, height: contentRect.height)
        
        // 全てのテキストフィールドのデリゲートになる
        for fld in myTextField {
            fld.delegate = self
        }
        
        // デフォルトの通知センターを得る
        let notification = NotificationCenter.default
        // キーボードのframeが変化した
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardChangeFrame(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        
        // キーボードが登場した
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // キーボードが退場した
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
}
