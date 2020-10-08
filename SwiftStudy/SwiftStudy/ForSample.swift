import UIKit

class ForSample {
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
