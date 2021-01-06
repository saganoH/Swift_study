import UIKit

class drawPresenter {
    
    private var viewCenter: CGPoint
    init(viewCenter: CGPoint) {
        self.viewCenter = viewCenter
    }
    
    private let numC = NumberDecider()
    
    func drawLine(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let percent = numC.makeRandomNum()
        // 円弧のパスを作る
        UIColor.red.setStroke()
        let arcPath = decidePath(80, percent)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .butt
        arcPath.stroke()
        
        // %のラベル
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedString.Key.font: font,
                                  NSAttributedString.Key.foregroundColor: UIColor.gray]
        let drawString = String(percent) + "%"
        let posX = viewCenter.x - 45
        let posY = viewCenter.y - 15
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        drawString.draw(in: rect, withAttributes: textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    private func decidePath(_ radius: CGFloat, _ percent: Double) -> UIBezierPath {
        let path = UIBezierPath(
            arcCenter: viewCenter,
            radius: radius,
            startAngle: CGFloat(-Double.pi/2),
            endAngle: CGFloat(numC.decideAngle(percent: percent)),
            clockwise: percent > 0)
        return path
    }
}
