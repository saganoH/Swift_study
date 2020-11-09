import UIKit

class Sec12ViewController3: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func changedStepperValue(_ sender: UIStepper) {
        //ステッパーの値をラベルに表示
        let num = Int(sender.value)
        numLabel.text = String(num)
    }
    
    @IBAction func showLabel(_ sender: UISwitch) {
        numLabel.isHidden = !sender.isOn
    }
    
    @IBOutlet weak var colorChip: UIView!
    
    @IBAction func changedColor(_ sender: UISegmentedControl) {
        //選ばれているインデックス番号で処理を振り分ける
        switch sender.selectedSegmentIndex {
        case 0:
            colorChip.backgroundColor = UIColor.blue
        case 1:
            colorChip.backgroundColor = UIColor.yellow
        case 2:
            colorChip.backgroundColor = UIColor.green
        default:
            colorChip.backgroundColor = UIColor.blue
        }
    }
    
    @IBOutlet weak var humikiri: UIImageView!
    
    @IBAction func changeSlider(_ sender: UISlider) {
        humikiri.alpha = CGFloat(sender.value)
    }
    
    @IBOutlet weak var numTextField: UITextField!
    
    @IBOutlet weak var numTextLabel: UILabel!
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myTextFieldのデリゲートになる
        numTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //色を作る
        func RGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
            let rgba = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
            return rgba
        }
        
        //背景色を変更
        let myBackColor = RGBA(red: 90, green: 200, blue: 200, alpha: 1)
        self.view.backgroundColor = myBackColor
    }
    
    //テキストフィールドが編集されると実行されるデリゲートメソッド
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //変更後の内容を作成する
        let tmpString = textField.text! as NSString
        let replacedString = tmpString.replacingCharacters(in: range, with: string)
        if replacedString == "" {
            //変更後が空の場合
            numTextLabel.text = "0"
        } else {
            //変更後の値を計算してラベルに表示する
            if let num = Int(replacedString) {
                numTextLabel.text = String(num * 25)
            }
        }
        return true
    }
    
    //クリアボタンで実行されるデリゲートメソッド
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        numTextLabel.text = "0"
        return true
    }
    
    //改行が入力された場合のデリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを下げる
        view.endEditing(true)
        return false //改行は入力しない
    }
}
