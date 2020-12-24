import UIKit

class Sec17ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
    }
    
    private func arcPercent(_ radius: CGFloat, _ percent: Double) -> UIBezierPath {
        let endAngle = (2 * Double.pi * percent/100) - (Double.pi/2)
        let path = UIBezierPath(
            arcCenter: view.center,
            radius: radius,
            startAngle: CGFloat(-Double.pi/2),
            endAngle: CGFloat(endAngle),
            clockwise: percent > 0)
        return path
    }
    
    private func drawLine() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let percent = 58.2
        // 円弧のパスを作る
        UIColor.red.setStroke()
        let arcPath = arcPercent(80, percent)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .butt
        arcPath.stroke()
        
        // %のラベル
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedString.Key.font: font,
                                  NSAttributedString.Key.foregroundColor: UIColor.gray]
        let drawString = String(percent) + "%"
        let posX = view.center.x - 45
        let posY = view.center.y - 15
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        drawString.draw(in: rect, withAttributes: textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
