

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
    

}
