import UIKit

class Sec13ViewController8: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    // 全てのテキストフィールド
    @IBOutlet var myTextField: [UITextField]!
    
    // 編集中のテキストフィールド
    private var editingField: UITextField?
    // 重なっている高さ
    private var overlap: CGFloat = 0.0
    private var lastOffsetY: CGFloat = 0.0
    
    // MARK: -デリゲートメソッド
    
    // 編集開始のデリゲートメソッド
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editingField = textField
    }
    
    // 編集終了のデリゲートメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingField = nil
    }
    
    // 改行時のデリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true) // キーボードを下げる
        return false // 改行コードは入力しない
    }
    
    // MARK: -
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true) // キーボードを下げる
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スワイプでスクロールさせたらキーボードを下げる
        scrollView.keyboardDismissMode = .onDrag
        
        // スクロールビューの領域を指定する
        let statusBarHeight: CGFloat = 20
        let scrollFrame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: view.frame.height - statusBarHeight)
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
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardChangeFrame(_:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        
        // キーボードが登場した
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // キーボードが退場した
        notification.addObserver(self, selector: #selector(Sec13ViewController8.keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // MARK: - イベントハンドラの実装
    
    @objc func keyboardChangeFrame(_ notification: Notification) {
        // 編集中にキーボードがない場合は中断する
        guard let fld = editingField else {
            return
        }
        
        // キーボードのframeを調べる
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // テキストフィールドのframeをキーボードと同じ座標系にする
        let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
        // テキストフィールドの下辺 - キーボードの上辺 + 空けたい間隔
        overlap = fld.frame.maxY - convertedKeyboardFrame.minY + 5
        if overlap > 0 {
            // キーボードで隠れている分だけスクロールする
            overlap += scrollView.contentOffset.y
            scrollView.setContentOffset(CGPoint(x: 0, y: overlap), animated: true)
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        // 現在のスクロール量を保存しておく
        lastOffsetY = scrollView.contentOffset.y
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        // スクロールを元に戻す
        scrollView.setContentOffset(CGPoint(x: 0, y: lastOffsetY), animated: true)
    }
}
