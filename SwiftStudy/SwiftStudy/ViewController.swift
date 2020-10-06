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
        
        checkRangeInt(value: -3)
        checkRangeInt(value: 2)
        checkRangeInt(value: 5)
        
        checkRangeDouble(0.1)
        checkRangeDouble(1.0)
        checkRangeDouble(1.5)
        
        changeColor()
        
    }
    
    //p68List　レンジ演算子の変化系
    func checkRangeInt(value : Int){
        let rangeInt = -5..<5
        print(rangeInt.contains(value))
    }

    func checkRangeDouble(_ value : Double){
        let rangeDouble = 0.0...1.0
        print(rangeDouble.contains(value))
    }

    
    func changeColor(){
        //p70List ビット演算子
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
        view.backgroundColor = UIColor(red:R, green:G, blue:B, alpha:1)

    }


}

