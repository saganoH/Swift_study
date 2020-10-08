import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkRangeInt(value: -3)
        checkRangeInt(value: 2)
        checkRangeInt(value: 5)
        
        checkRangeDouble(0.1)
        checkRangeDouble(1.0)
        checkRangeDouble(1.5)
        
        changeColor()
        
        let tokuten = arc4random_uniform(101)
        let score = (sugaku:arc4random_uniform(101), eigo:arc4random_uniform(101))
        
        ifStatement(tokuten)
        ifElseStatement(tokuten)
        ifElseIfStatement(tokuten)
        ifNesting(score.sugaku, score.eigo)
        ifAnd(score.sugaku, score.eigo)
        ifOr(score.sugaku, score.eigo)
        ifComma(sugaku: score.sugaku, eigo: score.eigo)
        
    }
    
    //p68List　レンジ演算子の変化系
    func checkRangeInt(value: Int){
        let rangeInt = -5..<5
        print(rangeInt.contains(value))
    }
    
    func checkRangeDouble(_ value: Double){
        let rangeDouble = 0.0...1.0
        print(rangeDouble.contains(value))
    }

    //p70List ビット演算子
    func changeColor(){
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
        view.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1)
    }
    
    //p73List　if文
    func ifStatement(_ tokuten: UInt32){
        let tokuten = 85
        if tokuten >= 80 {
            print("素晴らしい!")
        }
        print("\(tokuten)点でした。")
    }
    
    //p74List if-else文
    func ifElseStatement(_ tokuten: UInt32){
        
        if tokuten >= 60 {
            print("おめでとう！合格です。")
        } else {
            print("残念、不合格です。")
        }
        print("\(tokuten)点でした。")
    }
    
    //p75List if-else-if文
    func ifElseIfStatement(_ tokuten: UInt32){
        if tokuten < 30 {
            print("がんばりましょう")
        } else if tokuten < 80 {
            print("合格です")
        } else {
            print("素晴らしい！")
        }
        print("\(tokuten)点でした。")
    }
    
    //p75List ネスティング
    func ifNesting(_ sugaku: UInt32,_ eigo: UInt32){
        if sugaku >= 50 {
            if eigo >= 60 {
                print("おめでとう！合格")
            } else {
                print("残念、不合格")
            }
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p76List if and
    func ifAnd(_ sugaku: UInt32,_ eigo: UInt32){
        if (sugaku >= 50) && (eigo >= 60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p75List if or
    func ifOr(_ sugaku: UInt32,_ eigo: UInt32){
        if (sugaku >= 60) || (eigo >= 60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p76List ifカンマ区切り
    func ifComma(sugaku: UInt32, eigo: UInt32){
        if sugaku >= 50, eigo >= 50, (sugaku+eigo) >= 120 {
            print("合格", terminator: "／")
        } else {
            print("不合格", terminator: "／")
        }
        print("数学\(sugaku)、英語\(eigo)、合計\(sugaku+eigo)")
    }

}
