import UIKit

class Sec16ViewController3: UIViewController {
    
    let colorC = ColorDecider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 最初の色を設定する
        view.backgroundColor = colorC.currentColor()
    }
    
    @IBAction func dragColor(_ sender: UIPanGestureRecognizer) {
        // ドラッグした量を取得
        let translation = sender.translation(in: view)

        let color = colorC.updateColor(translation: translation)
        view.backgroundColor = color
    }
    
    @IBAction func comeHome16_3(segue: UIStoryboardSegue) {
    }
}
