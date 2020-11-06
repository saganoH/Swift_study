import UIKit

class Sec12ViewController3: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func changedStepperValue(_ sender: UIStepper) {
        //ステッパーの値をラベルに表示
        let num = Int(sender.value)
        numLabel.text = String(num)
    }
    
    @IBAction func showLabel(_ sender: UISwitch) {
        numLabel.isHidden = !sender.isOn
    }
    
    //これ実行したら表示されていない、なぜ？
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
