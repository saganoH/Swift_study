import UIKit
import WebKit

class Sec14ViewController2: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    // シーン移動の際に設定されるwebデータ
    var data: (name: String, url: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dataが設定されていればwebDataに代入する
        guard let webData = data else {
            return
        }
        // 表示するwebページのURLRequestを作る
        let myURL = URL(string: webData.url)
        let myRequest = URLRequest(url: myURL!)
        // WEBを読み込む
        webView.load(myRequest)
    }
}
