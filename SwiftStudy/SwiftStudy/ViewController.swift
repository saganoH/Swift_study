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
        
        switchString(theColor: "green")
        switchRange(num: arc4random_uniform(50))
        switchTuple(size: (6, 11))
        switchValueBinding(size: (4, 10))
        switchWhere(size: (45, 40, 100))
        switchDefaultOmit(apoint: (50, 100))
        switchFallthrough(abc: (a: false, b: false, c: false), fall: "b")
        
        forInRange()
        forInWildcard()
        forInNesting()
        forInArray()
        forInString()
        forInStride()
        
    }
    
    //p68List　レンジ演算子の変化系
    func checkRangeInt(value: Int) {
        let rangeInt = -5..<5
        print(rangeInt.contains(value))
    }
    
    func checkRangeDouble(_ value: Double) {
        let rangeDouble = 0.0...1.0
        print(rangeDouble.contains(value))
    }

    //p70List ビット演算子
    func changeColor() {
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
    func ifStatement(_ tokuten: UInt32) {
        let tokuten = 85
        if tokuten >= 80 {
            print("素晴らしい!")
        }
        print("\(tokuten)点でした。")
    }
    
    //p74List if-else文
    func ifElseStatement(_ tokuten: UInt32) {
        
        if tokuten >= 60 {
            print("おめでとう！合格です。")
        } else {
            print("残念、不合格です。")
        }
        print("\(tokuten)点でした。")
    }
    
    //p75List if-else-if文
    func ifElseIfStatement(_ tokuten: UInt32) {
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
    func ifNesting(_ sugaku: UInt32,_ eigo: UInt32) {
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
    func ifAnd(_ sugaku: UInt32,_ eigo: UInt32) {
        if (sugaku >= 50) && (eigo >= 60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p75List if or
    func ifOr(_ sugaku: UInt32,_ eigo: UInt32) {
        if (sugaku >= 60) || (eigo >= 60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p76List ifカンマ区切り
    func ifComma(sugaku: UInt32, eigo: UInt32) {
        if sugaku >= 50, eigo >= 50, (sugaku+eigo) >= 120 {
            print("合格", terminator: "／")
        } else {
            print("不合格", terminator: "／")
        }
        print("数学\(sugaku)、英語\(eigo)、合計\(sugaku+eigo)")
    }
    
    //p80List switch文
    func switchString(theColor: String) {
        switch theColor {
        case "red", "yellow":
            print("赤と黄色は注意")
        case "green":
            print("緑は快適")
        case "gray":
            print("グレーは停止中")
        default:
            print("その他は順調")
        }
        print(theColor)
    }
    
    //p80List レンジ振り分け
    func switchRange(num: UInt32) {
        for _ in 1...20 {
            print("\(num)", terminator: "")
            switch num {
            case (10...15):
                print(":交換 ", terminator: "")
            case 20, (31...35), 40:
                print(":再検査 ", terminator: "")
            default:
                print(":合格 ", terminator: "")
            }
        }
    }
    
    //p81List タプル振り分け
    func switchTuple(size: (Int, Int)) {
        switch size {
        case (0, 0):
            print("幅高さともに0です")
        case (5...10, 5...10):
            print("規定サイズです")
        case (_, 5...10):
            print("幅\(size.0)が規格外です")
        case (5...10, _):
            print("高さ\(size.1)が規格外です")
        default:
            print("幅高さともに規格外です")
        }
    }
    
    //p81List バリューバインディング
    func switchValueBinding(size: (Int, Int)) {
        switch size {
        case (0, 0):
            print("幅高さともに0です")
        case (5...10, 5...10):
            print("規定サイズです")
        case (5...10, let height):
            print("幅\(height)が規格外です")
        case (let width, 5...10):
            print("高さ\(width)が規格外です")
        default:
            print("幅高さともに規格外です")
        }
    }
    
    //p82List 条件式振り分け
    func switchWhere(size: (Int, Int, Int)) {
        switch size {
        case let (width, height, _) where (width >= 60) || (height >= 60):
            print("規定外：幅高さのどちらかが60以上")
        case let (_, _, weight) where (weight >= 80):
            print("規定外：重さ80以上")
        default:
            print("規定サイズ内")
        }
    }
    
    //p82List default省略
    func switchDefaultOmit(apoint: (Int, Int)) {
        switch apoint {
        case (0, 0):
            print("中心点です")
        case (0, _):
            print("x軸上の点です")
        case (_, 0):
            print("y軸上の点です")
        case let(x, y):
            print("点(\(x), \(y))です")
        }
    }
    
    //p83List fallthrough
    func switchFallthrough(abc: (a: Bool, b: Bool, c: Bool), fall: Character) {
        var abcRe = abc
        switch fall {
        case "a":
            abcRe.a = true
            fallthrough
        case "b":
            abcRe.b = true
            fallthrough
        case "c":
            abcRe.c = true
            fallthrough
        default:
            print(abcRe)
        }
    }
    
    //p85List for-in文
    func forInRange() {
        for num in 5...9 {
            let value = num * 2
            print(value, terminator: ",")
        }
    }
    
    //p85List 繰り返しのみ
    func forInWildcard() {
        for _ in 1...15 {
            let num = arc4random_uniform(100)
            print(num, terminator: ",")
        }
    }
    
    //p85List for-inのネスティング
    func forInNesting() {
        for i in 0...2 {
            for j in 0...2 {
                let point = (5*i, 10*j)
                print("\(i)-\(j)回目 \(point)")
            }
        }
    }
    
    //p86List 配列から順に取り出す
    func forInArray() {
        let numList = [3, 2, 6, 5, 8, 7, 9]
        var sum = 0
        for num in numList {
            sum += num
        }
        print("合計 \(sum)")
    }
    
    //p87List ストリングから順に取り出す
    func forInString() {
        let message = "おもてなし"
        for char in message {
            print(char)
        }
    }
    
    //p87List 飛び飛びで繰り返す
    func forInStride() {
        for num in stride(from: 10, to: 30, by: 3) {
            print(num, terminator: ",")
        }
    }
    
    

}
