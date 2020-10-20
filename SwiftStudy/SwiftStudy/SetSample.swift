class SetSample {
    //p165 セットを作る
    func SetColor() {
        let colorSet: Set<String> = ["red", "green", "blue", "green"]
        print(colorSet)
        print(type(of: colorSet))
    }
    
    //p165 配列とセットの変換
    func setArraySet() {
        var colorArray = ["red", "green", "blue", "green"]
        print(colorArray, type(of: colorArray))
        let colorSet = Set(colorArray)
        colorArray = Array(colorSet)
        print(colorSet, type(of: colorSet))
        print(colorArray, type(of: colorArray))
    }
    
    //p166　セットの追加削除
    func setInsertRemove() {
        var numSetA: Set<Int> = []
        var charsSetB = Set<Character>()
        
        numSetA.insert(3)
        numSetA.insert(5)
        numSetA.insert(7)
        numSetA.insert(3)
        print(numSetA)
        charsSetB.insert("c")
        
        if let theNum = numSetA.remove(3) {
            print("\(theNum)を取り除きました。")
        } else {
            print("セットの変化はありません。")
        }
        print(numSetA)
        
        if charsSetB.isEmpty {
            print("charsSetBは空です。")
        } else {
            print("charsSetBには\(charsSetB.count)個の値が入っています。")
        }
    }
}
