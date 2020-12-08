import UIKit

class Sec18ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    
    @IBAction func saveStatus(_ sender: Any) {
        // mySwitch1の値をキー"switchOn"で保存する
        UserDefaults.standard.set(mySwitch1.isOn, forKey: "switchOn")
    }
    
    @IBAction func readStatus(_ sender: Any) {
        // キー"switchOn"の値をBoolとして読んでmySwitchに設定する
        mySwitch2.isOn = UserDefaults.standard.bool(forKey: "switchOn")
    }
    
    @IBAction func comeHome18(segue: UIStoryboardSegue) {
    }
}
