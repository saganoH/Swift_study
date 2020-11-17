import UIKit

class Sec13ViewController7: UIViewController {
    
    // スクロールビュー
    @IBOutlet weak var myScrollView: UIScrollView!
    
    // スクロールビューのサブビュー
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // スクロールビューの領域を指定する
        let scrollFrame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height-20)
        myScrollView.frame = scrollFrame
        // コンテンツのサイズを指定する
        let contentRect = contentView.bounds
        myScrollView.contentSize = CGSize(width: contentRect.width, height: contentRect.height)
    }
}
