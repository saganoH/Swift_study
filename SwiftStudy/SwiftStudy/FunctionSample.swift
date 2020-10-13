import Foundation

class FunctionSample {
   //p96List
    func funcDice(_ num: UInt32) -> Int {
        let number = 1 + num
        return Int(number)
    }
    
    //p99List
    func thanks(num: Int) {
        if num <= 0 {
            return
        }
        print("\(num)個。ありがとうございました。")
    }
    
    //p100List
    func half(num: Double) {
        //最後に必ず実行する
        defer {
            print("計算終了")
        }
        guard num >= 10 else {
            return
        }
        let halfNum = num / 2
        print("\(num)の半分は\(halfNum)")
    }
    
    //p103List
    func price1(ninzu: Int) -> Int {
        let tanka = 1200
        let result = tanka * ninzu
        return result
    }
    
    //p104List
    func sum(numbers: Double...) -> Double {
        var total: Double = 0.0
        for num in numbers {
            total += num
        }
        return total
    }
    
    //p105List
    func price3(tanka: Int, kosu: Int = 1, souryou: Int = 250) -> Int {
        let result = tanka * kosu + souryou
        return result
    }
    
    //p106List
    func price() {
        let ex1 = price3(tanka: 1000)
        print("\(ex1)円")
        let ex2 = price3(tanka: 1200, kosu: 5, souryou: 0)
        print("\(ex2)円")
    }
    
    //p108List
    func testResult(kokugo: Int, sugaku: Int, eigo: Int) -> (total: Int, average: Double) {
        let total = kokugo + sugaku + eigo
        var ave = Double(total) / 3
        ave = round(ave * 10) / 10
        return (total, ave)
    }
    
    //p108List 名前変更したためoverloadしてない
    func additionInt(a: Int, b: Int) -> Int {
        return a + b
    }
    
    //p109List
    func multiplicationInt(c: Int, d: Int) -> Int {
        return c * d
    }
    
    func tripleCalcInt(a: Int, b: Int, c: Int) -> Int {
        return (a + b) * c
    }
    
    //p110List
    func bmi(weight kg: Double, height cm: Double) -> Double {
        if cm == 0 {
            return -1
        }
        var result = kg / pow(cm * 0.01, 2)
        result = round(result * 10) / 10.0
        return result
    }
    
    //p112List
    func triangleArea(_ width: Double, _ height: Double) -> Double {
        let result = width * height / 2
        return result
    }
    
    
}
