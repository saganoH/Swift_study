//
//  ViewController.swift
//  SwiftStudy
//
//  Created by sagano hikaru on 2020/10/05.
//
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ifStatement()
        ifElseStatement()
        ifElseIfStatement()
        ifNesting()
        ifAnd()
        ifOr()
        ifComma()
        
    }
    
    //p73List　if文
    func ifStatement(){
        let tokuten = 85
        if tokuten>=80 {
            print("素晴らしい!")
        }
        print("\(tokuten)点でした。")
    }
    
    //p74List if-else文
    func ifElseStatement(){
        let tokuten = arc4random_uniform(101)
        if tokuten>=60 {
            print("おめでとう！合格です。")
        } else {
            print("残念、不合格です。")
        }
        print("\(tokuten)点でした。")
    }

    //p75List if-else-if文
    func ifElseIfStatement(){
        let tokuten = arc4random_uniform(101)
        if tokuten<30 {
            print("がんばりましょう")
        } else if tokuten<80{
            print("合格です")
        } else {
            print("素晴らしい！")
        }
        print("\(tokuten)点でした。")
    }
    
    //p75List ネスティング
    func ifNesting(){
        let sugaku = arc4random_uniform(101)
        let eigo = arc4random_uniform(101)
        
        if sugaku>=50 {
            if eigo>=60 {
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
    func ifAnd(){
        let sugaku = arc4random_uniform(101)
        let eigo = arc4random_uniform(101)
        
        if (sugaku>=50) && (eigo>=60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p75List if or
    func ifOr(){
        let sugaku = arc4random_uniform(101)
        let eigo = arc4random_uniform(101)
        
        if (sugaku>=60) || (eigo>=60) {
            print("おめでとう！合格")
        } else {
            print("残念、不合格")
        }
        print("数学\(sugaku)、英語\(eigo)")
    }
    
    //p76List ifカンマ区切り
    func ifComma(){
        let sugaku = 56
        let eigo = 62
        
        if sugaku>=50, eigo>=50, (sugaku+eigo)>=120 {
            print("合格", terminator: "／") //到達不能
        } else {
            print("不合格", terminator: "／")
        }
        print("数学\(sugaku)、英語\(eigo)、合計\(sugaku+eigo)")
    }

}
