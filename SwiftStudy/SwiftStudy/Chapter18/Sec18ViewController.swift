import UIKit

class Sec18ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    // ユーザーデフォルトを参照する
    private let defaults = UserDefaults.standard
    
    @IBAction func saveStatus(_ sender: Any) {
        // mySwitch1の値をキー"switchOn"で保存する
        defaults.set(mySwitch1.isOn, forKey: "switchOn")
    }
    
    @IBAction func readStatus(_ sender: Any) {
        // キー"switchOn"の値をBoolとして読んでmySwitchに設定する
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")
    }
}
