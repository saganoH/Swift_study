import UIKit

class Sec16ViewController2: UIViewController {
    
    @IBAction func dragging(_ sender: UIPanGestureRecognizer) {
        let car = sender.view!
        // 指の座標に合わせる
        car.center = sender.location(in: self.view)
    }
    
    @IBAction func comeHome16_2(segue: UIStoryboardSegue) {
    }
    
}
