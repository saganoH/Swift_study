class SwitchSample {
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
}
