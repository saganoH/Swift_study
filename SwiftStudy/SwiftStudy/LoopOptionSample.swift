import Foundation

class LoopOptionSample {
    //p92List continue
    func forInContinue() {
        let vlist = [3, 5, -2, 6, -8, 2]
        var total = 0
        for v in vlist {
            if v < 0 {
                continue
            }
            total += v
            print("\(v),")
        }
        print(" 合計 : \(total)")
    }
    
    //p93List break
    func whileBreak() {
        var num: UInt32 = 0
        while true {
            num = arc4random_uniform(100)
            if num > 70 {
                break
            }
        }
        print(num)
    }
    
    //p93List ループのラベル
    func loopLabel() {
        xloop: for x in 0...3 {
            yloop: for y in 0...3 {
                if x < y {
                    print("---------")
                    continue xloop
                }
                print((x, y))
            }
        }
    }
    
    //p94List ラベル指定break
    func loopLabelBreak() {
        let vlist: Array = [ [4, 2], [5], [9, 8, 10], [6, 8, -9], [4, 2], [9, 3] ]
        outloop: for alist in vlist {
            inloop: for v in alist {
                if v < 0 {
                    print(alist)
                    break outloop
                }
            }
        }
    }
}
