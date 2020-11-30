class ArraySample {
    //p132 配列を作る
    func arrayMake() {
        let strArray = ["a", "b", "c", "d", "e"]
        let intArray = [1, 2, 3, 4, 5]
        var boolArray = [true, true, false, false]
        var tupleArray = [(0, 0), (100, 120), (180, 200)]
    
        boolArray.append(true)
        tupleArray[0] = (1, 1)
    
        print(strArray)
        print(intArray)
        print(boolArray)
        print(tupleArray)
    }
    
    //p133 型を限定した配列-配列の個数
    func arrayType() {
        let colors: [String] = ["red", "blue", "green"]
        let numList: [Int] = [12, 34, 56, 78, 90]
        var resultList: [Bool]
        resultList = [true, false, true, false]
        
        if colors.isEmpty {
            print("colorsは空の配列です")
        } else {
            print("colorsは空ではありません")
        }
        
        print(numList.count)
        print(resultList)
    }
    
    //p135 同じ値で初期化
    func arrayRepeat() {
        let zeroList = [Double](repeating: 0.0, count: 10)
        let xList = [String](repeating: "未設定", count: 5)
        print(zeroList)
        print(xList)
    }
    
    //p136　連続番号が入った配列を作る、配列を連結する
    func arrayRange() {
        let numbers1 = [Int](-3...3)
        print(numbers1)
        
        let numbers2 = Array<Int>(5..<10)
        print(numbers2)
        
        let basicCourse = ["ラン", "スイム"]
        let fullCourse = basicCourse + ["バイク", "カヌー"]
        print(basicCourse)
        print(fullCourse)
    }
    
    //p137 配列から値を取り出す
    func arrayAccess() {
        let abcArray = ["a", "b", "c", "d"]
        let str1 = abcArray[0]
        let str2 = abcArray[2]
        print(str1)
        print(str2)
    }
    
    //p138 配列のスライス
    func arraySlice() {
        let colorList = ["blue", "yellow", "red", "green", "pink"]
        let myColor = colorList[1...3]
        print(myColor)
    }

    //p138　２つの配列に分ける
    func arraySlice2() {
        let names = ["佐藤", "鈴木", "青木", "栗田", "篠原"]
        let half = names.count / 2
        let group1 = names[..<half]
        let group2 = names[half...]
        print(group1)
        print(group2)
    }
    
    //p138 値の入れ替え
    func arrayAccessUpdate() {
        var theArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        theArray[0] = "あ"
        theArray[2] = "いう"
        theArray[4...6] = ["赤", "白", "黄色", "青", "緑"]
        print(theArray)
    }
    
    //p139　配列のネスティング
    func arrayNesting() {
        var nestArray = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
        let theValue = nestArray[1][2]
        nestArray[2][0] = "Hello"
        print(theValue)
        print(nestArray)
    }
    
    //p140 インデックス番号と値
    func arrayEnumerate() {
        let colorList = ["blue", "yellow", "red", "green"]
        for (index, value) in colorList.enumerated() {
            print((index, value))
        }
    }
    
    //p141 最初と最後の値を取り出す
    func arrayFirstLast() {
        let emptyArray = [Int]()
        let abcArray = ["a", "b", "c", "d"]
        
        if let item = emptyArray.first {
            print(item)
        }
        if let item = abcArray.last {
            print(item)
        }
    }
    
    //p141 配列の値を検索
    func arrayIndex() {
        let color = "yellow"
        let colors = ["blue", "yellow", "pink"]
        let indexNo = colors.firstIndex(of: color)
        if indexNo == nil {
            print("\(color)は見つかりませんでした。")
        } else {
            print("\(color)はインデックス番号\(indexNo!)にありました。")
        }
    }
    
    //p142 値を追加・挿入する
    func arrayApendInsert() {
        var colors = ["red", "green"]
        colors.append("yellow")
        colors.append(contentsOf: ["black", "white"])
        print(colors)
        
        var aList = ["a", "b", "c", "d"]
        aList.insert("xyz", at: 2)
        print(aList)
    }
    
    //p142 値の削除
    func arrayRemove() {
        var colorArray = ["red", "blue", "green", "black", "white"]
        var delColor = colorArray.remove(at: 2)
        print("\(delColor)を削除しました。")
        delColor = colorArray.removeFirst()
        print("\(delColor)を削除しました。")
        delColor = colorArray.removeLast()
        print("\(delColor)を削除しました。")
        colorArray.removeAll()
        print(colorArray)
    }
    
    //p144 配列の複製
    func arrayCopy() {
        var array1 = [1, 2, 3]
        let array2 = array1
        array1[0] = 99
        print("array1\(array1)")
        print("array2\(array2)")
    }
    
    //p146　配列のソート
    func arraySort() {
        var ageArray = [34, 23, 31, 26, 28, 22]
        ageArray.sort()
        print(ageArray)
    }
    
    //p146 ソート済みの配列を新規作成
    func arraySorted() {
        let fruit = ["orange", "apple", "pineapple", "banana"]
        let fruitSorted = fruit.sorted()
        print(fruit)
        print(fruitSorted)
    }
    
    //p147 フィルタ
    func arrayFilter() {
        let ageArray = [21, 30, 28, 35, 45, 52, 33]
        let age30to39 = ageArray.filter({(age: Int) -> Bool in
            return (age >= 30) && (age < 40)
        })
        print(age30to39)
    }
    
    //p147　マップ
    func arrayMap() {
        let numbers = [10, 20, 30, 40]
        let plusOnes = numbers.map({(num: Int) -> Int in
            return num + 1
        })
        print(plusOnes)
    }
}
