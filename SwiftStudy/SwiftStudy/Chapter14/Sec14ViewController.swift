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
        
        alert.addTextField { (textField) -> Void in
            // テキストフィールドのデリゲートになる
            textField.delegate = self
        }
        
        // ボタン1
        alert.addAction(
            UIAlertAction(
                title: "ボタン1",
                style: .default,
                handler: { (action) -> Void in self.hello(action.title!) }
            )
        )
        // ボタン2
        alert.addAction(
            UIAlertAction(
                title: "ボタン2",
                style: .default,
                handler: { (action) -> Void in self.hello(action.title!) }
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
                handler: { (action) -> Void in self.hello(action.title!) }
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
    
    @IBAction func showActionSheet(_ sender: Any) {
        // アクションシートを作る
        let actionSheet = UIAlertController(
            title: "タイトル",
            message: "メッセージ文",
            preferredStyle: .actionSheet)
        
        // ボタン1
        actionSheet.addAction(
            UIAlertAction(title: "ボタン1です",
                          style: .default,
                          handler: { (action) -> Void in self.hello(action.title!) }
            )
        )
        // キャンセル
        actionSheet.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        //アクションシートを表示する
        self.present(
            actionSheet,
            animated: true,
            completion: {
                // 表示完了後に実行
                print("アクションシートが表示された")
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
