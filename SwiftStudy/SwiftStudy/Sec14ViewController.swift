import UIKit

class Sec14ViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func backToHome(_ sender: Any) {
        // 現在のシーンを閉じて元のシーンに戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        // アラートを作る
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "タイトル"
        alert.message = "メッセージ"
        
        alert.addTextField{(textField) -> Void in
            // テキストフィールドのデリゲートになる
            textField.delegate = self
        }
        
        // ボタン１
        alert.addAction(
            UIAlertAction(
                title: "ボタン１",
                style: .default,
                handler: {(action) -> Void in self.hello(action.title!)}
            )
        )
        
        // ボタン２
        alert.addAction(
            UIAlertAction(
                title: "ボタン２",
                style: .default,
                handler: {(action) -> Void in self.hello(action.title!)}
            )
        )
        
        // キャンセル
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        
        // 赤色のボタン
        alert.addAction(
            UIAlertAction(
                title: "削除します",
                style: .destructive,
                handler: {(action) -> Void in self.hello(action.title!)}
            )
        )
        
        // アラートを表示する
        self.present(
            alert,
            animated: true,
            completion: {
                // 表示完了後に実行
                print("アラートが表示された")
            }
        )
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text!)
    }
    
    func hello(_ message: String) {
        print(message)
    }
    
}
