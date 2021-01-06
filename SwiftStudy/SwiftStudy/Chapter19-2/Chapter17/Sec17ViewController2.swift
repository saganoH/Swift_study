import UIKit

class Sec17ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawC = drawPresenter(viewCenter: view.center)
        
        let drawImage = drawC.drawLine(size: view.bounds.size)
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
    }
}
