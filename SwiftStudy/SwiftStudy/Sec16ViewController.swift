import UIKit

class Sec16ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hello(_:)))
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        let myLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 90, height: 30))
        myLabel.text = "タップ"
        myView.backgroundColor = UIColor.green
        // tagに番号をつける
        myView.tag = 1
        myView.addGestureRecognizer(tapGesture)
        view.addSubview(myView)
        myView.addSubview(myLabel)
    }
    
    @objc func hello(_ sender: UITapGestureRecognizer) {
        // tagの番号を調べる
        let tagNo = sender.view?.tag
        print("ハロー", tagNo!)
    }
    
    @IBAction func comeHome16(segue: UIStoryboardSegue) {
    }
}
