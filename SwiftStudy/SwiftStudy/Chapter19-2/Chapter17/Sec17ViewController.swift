import  UIKit

class Sec17ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxImage = makeBoxImage(width: 240, height: 180)
        let boxView = UIImageView(image: boxImage)
        
        boxView.center = view.center
        view.addSubview(boxView)
    }
    
    private func makeBoxImage(width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        // サイズを決める
        let drawRect = CGRect(x: 0, y: 0, width: width, height: height)
        // パスを作る
        let drawPath = UIBezierPath(rect: drawRect)
        
        // 指定した塗り色でパスを塗る
        context?.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        drawPath.fill()
        // 指定した線の色でパスを描く
        context?.setStrokeColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        drawPath.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
}
