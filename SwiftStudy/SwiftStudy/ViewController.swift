import UIKit

//p221 クラス拡張
extension UIColor {
    //若草色
    class var wakakusa: UIColor {
        //#ABC900
        return UIColor(red: 0.6706, green: 0.7882, blue: 0.0, alpha: 1)
    }
    //紅赤色
    class var beniaka: UIColor {
        //#E5004F
        return UIColor(red: 0.898, green: 0.0, blue: 0.3098, alpha: 1)
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sec2Sample()
        //sec3Sample()
        //sec4Sample()
        //sec5Sample()
        //sec6Sample()
        //sec7Sample()
        //sec8Sample()
        //sec9Sample1()
        //sec9Sample2()
        //sec10Sample1()
        
        //sec10-2
        let structC = StructSample()
        structC.makeColorBox()
        structC.makeBox()
        structC.makeGoods()
        structC.moveLine()
        structC.stockCheck()
        structC.makeMonster()
    }
    
    func sec2Sample() {
        let operatorC = OperatorSample()
        _ = operatorC.checkRangeInt(value: -3)
        _ = operatorC.checkRangeInt(value: 2)
        _ = operatorC.checkRangeInt(value: 5)
        _ = operatorC.checkRangeDouble(0.1)
        _ = operatorC.checkRangeDouble(1.0)
        _ = operatorC.checkRangeDouble(1.5)
        operatorC.changeColor(vc: self)
        
        let tokuten = arc4random_uniform(101)
        let score = (sugaku:arc4random_uniform(101), eigo:arc4random_uniform(101))
        let ifC = IfSample()
        ifC.ifStatement(tokuten)
        ifC.ifElseStatement(tokuten)
        ifC.ifElseIfStatement(tokuten)
        ifC.ifNesting(score.sugaku, score.eigo)
        ifC.ifAnd(score.sugaku, score.eigo)
        ifC.ifOr(score.sugaku, score.eigo)
        ifC.ifComma(sugaku: score.sugaku, eigo: score.eigo)
        
        let switchC = SwitchSample()
        switchC.switchString(theColor: "green")
        switchC.switchRange(num: arc4random_uniform(50))
        switchC.switchTuple(size: (6, 11))
        switchC.switchValueBinding(size: (4, 10))
        switchC.switchWhere(size: (45, 40, 100))
        switchC.switchDefaultOmit(apoint: (50, 100))
        switchC.switchFallthrough(abc: (a: false, b: false, c: false), fall: "b")
        
        let forC = ForSample()
        forC.forInRange()
        forC.forInWildcard()
        forC.forInNesting()
        forC.forInArray()
        forC.forInString()
        forC.forInStride()
        print("")
        
        let whileC = WhileSample()
        whileC.whileLoop()
        whileC.repeatWhileLoop()
        
        let loopC = LoopOptionSample()
        loopC.forInContinue()
        loopC.whileBreak()
        loopC.loopLabel()
        loopC.loopLabelBreak()
    }

    func sec3Sample() {
        let functionC = FunctionSample()
        for _ in 1...5 {
            let num = functionC.funcDice(arc4random_uniform(6))
            print(num)
        }
        
        functionC.thanks(num:5)
        functionC.thanks(num:0)
        
        functionC.half(num: 25)
        functionC.half(num: 9)
        functionC.half(num: 12)
        
        let price = functionC.price1(ninzu: 5)
        print(price)
        
        let sum = functionC.sum(numbers: 0.1, 0.7, 1.6)
        print(sum)
        
        functionC.price()
        
        let result = functionC.testResult(kokugo: 98, sugaku: 39, eigo: 56)
        print("合計 \(result.total)")
        print("平均 \(result.average)")
        
        let ans1 = functionC.additionInt(a: 2, b: 3)
        let ans2 = functionC.multiplicationInt(c: 2, d: 3)
        let ans3 = functionC.tripleCalcInt(a: 2, b: 3, c: 4)
        print(ans1)
        print(ans2)
        print(ans3)
        
        let myBMI = functionC.bmi(weight: 56.0, height: 172.5)
        print(myBMI)
        
        let area = functionC.triangleArea(30, 16.5)
        print(area)
    }
    
    func sec4Sample() {
        let stringSample = StringSample()
        stringSample.stringIndex()
        stringSample.indexAfter()
        stringSample.indexOffsetBy()
        stringSample.stringRangeOperator()
        
        let recomendName = stringSample.stringCap("koseKi YuuTa")
        print(recomendName)
        
        stringSample.stringCompare()
        stringSample.stringBigger()
        stringSample.stringCompareCase()
        stringSample.stringHasPrefix()
        stringSample.stringContains()
        stringSample.rangeSubstring()
        stringSample.stringRemove()
        
    }
    
    func sec5Sample() {
        let arrayC = ArraySample()
        arrayC.arrayMake()
        arrayC.arrayType()
        arrayC.arrayRepeat()
        arrayC.arrayRange()
        arrayC.arrayAccess()
        arrayC.arraySlice()
        arrayC.arraySlice2()
        arrayC.arrayAccessUpdate()
        arrayC.arrayNesting()
        arrayC.arrayEnumerate()
        arrayC.arrayFirstLast()
        arrayC.arrayIndex()
        arrayC.arrayApendInsert()
        arrayC.arrayRemove()
        arrayC.arrayCopy()
        arrayC.arraySort()
        arrayC.arraySorted()
        arrayC.arrayFilter()
        arrayC.arrayMap()
    }
    
    func sec6Sample() {
        let dictionaryC = DictionarySample()
        dictionaryC.dictionarySample()
        dictionaryC.dictionaryEmpty()
        dictionaryC.dictionaryAccess()
        dictionaryC.updateMembers(theKey: "大阪", newValue: 17)
        dictionaryC.updateMembers(theKey: "沖縄", newValue: 14)
        dictionaryC.dictionaryCopy()
        dictionaryC.dictionaryForIn()
        dictionaryC.dictionaryRemove()
    }
    
    func sec7Sample() {
        let setC = SetSample()
        setC.SetColor()
        setC.setArraySet()
        setC.setInsertRemove()
        setC.setContain()
        setC.setForIn()
        setC.setUnion()
        setC.setIntersection()
        setC.setSubtracting()
        setC.setSymmetricDifference()
        setC.setEqual()
        setC.setIsDisjoint()
        setC.setIsSubset()
        setC.setIsSuperset()
    }
    
    func sec8Sample() {
        let optionalC = OptionalSample()
        optionalC.lastNumError()
        optionalC.nilError()
        optionalC.multiplyPrice()
        optionalC.optionalBinding()
        optionalC.sumInt()
        optionalC.starRepeating()
        optionalC.printGreeting("サクラ", nil)
        optionalC.printGreeting("バラ", 99)
        optionalC.printYears()
        optionalC.printBallSize()
        optionalC.optionalBindingChain()
    }
    
    func sec9Sample1() {
        let initSample1 = ClassSample(msg: "こんにちは")
        initSample1.hello()
        let initSample2 = ClassSample(msg: "こんにちは", name: "桜子")
        initSample2.hello()
        let initSample3 = ClassSample()
        initSample3.hello()
        
        //computedプロパティ
        let myCircle = Circle()
        print("半径\(myCircle.radius)")
        print("面積\(myCircle.area)")
        myCircle.area *= 2
        print("半径\(myCircle.radius)")
        print("面積\(myCircle.area)")
        myCircle.radius = 3.0
        print("半径\(myCircle.radius)")
        print("面積\(myCircle.area)")
        
        //プロパティオブザーバー
        let thePlayer = Player()
        thePlayer.level = 10
        thePlayer.level = 10 //値が変化しないのでカウントされない
        thePlayer.level = 15
        
        //クラスプロパティ
        let car1 = Car()
        let car2 = Car()
        print("動いている車は\(Car.count)台")
        car1.start()
        car2.start()
        print("動いている車は\(Car.count)台")
        car2.stop()
        print("動いている車は\(Car.count)台")
        
        //アクセス権
        let player1 = Game()
        let player2 = Game()
        player1.addPoint(value: 5)
        player2.addPoint(value: 7)
        print("player1: レベル\(player1.level)") //読むことはできる
        print("player2: レベル\(player2.level)")
    }
    
    func sec9Sample2() {
        //標準の色
        let color1 = UIColor.red
        //拡張した色
        let color2 = UIColor.wakakusa
        let color3 = UIColor.beniaka
        //画面の背景色を紅赤色にする
        view.backgroundColor = color3
        print(color1)
        print(color2)
        
        //プロトコルを採用したクラスのインスタンスを作り、実行
        let newGamePlayer = NewGame()
        newGamePlayer.hit()
        print(newGamePlayer.gamePoint)
        newGamePlayer.miss()
        print(newGamePlayer.gamePoint)
        newGamePlayer.hit()
        print(newGamePlayer.gamePoint)
    }
    
    func sec10Sample1() {
        let enumC = EnumSample()
        let theStuff = enumC.packing(size: .M)
        print(theStuff)
        
        enumC.changeCourse()
        enumC.shirtPattern()
        enumC.ticketType()
        enumC.signalController()
    }
}
