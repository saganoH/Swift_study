import UIKit

class OperatorSample {
    //p68List　レンジ演算子の変化系
    func checkRangeInt(value: Int) -> Bool {
        let rangeInt = -5..<5
        print(rangeInt.contains(value))

        return rangeInt.contains(value)
    }
    
    func checkRangeDouble(_ value: Double) -> Bool {
        let rangeDouble = 0.0...1.0
        print(rangeDouble.contains(value))

        return rangeDouble.contains(value)
    }

    //p70List ビット演算子
    func changeColor(vc: UIViewController) {
        //16進数RRGGBBをR、G、Bに分解
        let RGB: UInt32 = 0x40E0D0
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        print("red \(red), green \(green), blue \(blue)")
        
        //背景色に設定
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        vc.view.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1)
    }
}
