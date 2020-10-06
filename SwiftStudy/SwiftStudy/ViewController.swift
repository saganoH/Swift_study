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
        // Do any additional setup after loading the view.
        
        //p68List
        //レンジ演算子
        
        //整数の範囲
        let rangeInt = -5..<5
        print(rangeInt.contains(-3))
        print(rangeInt.contains(2))
        print(rangeInt.contains(5)) //範囲外
        print("--------------------------")
        //実数の範囲
        let rangeDouble = 0.0...1.0
        print(rangeDouble.contains(0.1))
        print(rangeDouble.contains(1.0))
        print(rangeDouble.contains(1.5)) //範囲外

       

    }


}

