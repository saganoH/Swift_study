import UIKit

// ドラッグした量から背景色を決めるクラス
class ColorDecider {
    
    private var kakudo: CGFloat = 180.0
    
    func currentColor() -> UIColor {
        return UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    func updateColor(translation: CGPoint) -> UIColor {
        if translation.x > 0 {
            // 右へドラッグしたら色相環を右回り
            kakudo -= 1.0
        } else {
            // 左へドラッグしたら色相環を左回り
            kakudo += 1.0
        }
        
        // 色相感を循環する
        if kakudo < 0 {
            kakudo += 360
        } else if kakudo > 360 {
            kakudo -= 360
        }
        
        return UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}
