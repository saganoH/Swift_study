import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sec2Sample()
        //sec3Sample()
        //sec4Sample()
        //sec5Sample()
        //sec6Sample()
        //sec7Sample()
        
        //sec8
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
}
