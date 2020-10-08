import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operatorC = OperatorSample()
        operatorC.checkRangeInt(value: -3)
        operatorC.checkRangeInt(value: 2)
        operatorC.checkRangeInt(value: 5)
        operatorC.checkRangeDouble(0.1)
        operatorC.checkRangeDouble(1.0)
        operatorC.checkRangeDouble(1.5)
        operatorC.changeColor()
        
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
        
        print("-----chapter2 done-----")
        
    }
    
}
