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
    
    //p168 セットに含まれている値かどうか
    func setContain() {
        let lunchSet: Set = ["カレー", "ナン", "チャイ"]
        let member = "チャイ"
        if lunchSet.contains(member) {
            print("\(member)はセットに含まれています。")
        } else {
            print("\(member)はセットに含まれていません。")
        }
    }
    
    //p168 ソートして全て取り出す
    func setForIn() {
        let numSet: Set<Double> = [3.2, 5.8, 1.4, 9.6, 5.5, 2.7]
        for num in numSet.sorted() {
            print(num, terminator: "点")
        }
    }
    
    //p169　セットとセットを合わせる、和集合
    func setUnion() {
        let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
        let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]
        let cSet = aSet.union(bSet)
        print(cSet)
    }
    
    //p170　積集合
    func setIntersection() {
        let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
        let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]
        let cSet = aSet.intersection(bSet)
        print(cSet)
    }
    
    //p171　差集合
    func setSubtracting() {
        let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
        let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]
        let cSet = aSet.subtracting(bSet)
        print(cSet)
    }
    
    //p171　対称差
    func setSymmetricDifference() {
        let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
        let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]
        let cSet = aSet.symmetricDifference(bSet)
        print(cSet)
    }
    
    //p172　等しいセット
    func setEqual() {
        let aSet: Set<Int> = [5, 6, 7, 8]
        let bSet: Set<Int> = [7, 8, 5, 6]
        let cSet: Set<Int> = [4, 5, 6, 7]
        print(aSet == bSet)
        print(aSet != cSet)
    }
    
    //p173　共通した値
    func setIsDisjoint() {
        let aSet: Set<Int> = [5, 6, 7, 8]
        let bSet: Set<Int> = [1, 8, 2, 5]
        if aSet.isDisjoint(with: bSet) {
            print("aSetとbSetには共通した値がありません。")
        } else {
            print("aSetとbSetには共通した値があります。")
            print(aSet.intersection(bSet))
        }
    }
    
    //p174　部分集合
    func setIsSubset() {
        let aSet: Set<String> = ["a", "b", "c", "d"]
        let bSet: Set<String> = ["a", "c"]
        if bSet.isSubset(of: aSet) {
            print("bSetはaSetのサブセットです。")
        } else {
            print("bSetはaSetのサブセットではありません。")
        }
    }
    
    //p174 上位集合
    func setIsSuperset() {
        let aSet: Set<String> = ["a", "b", "c", "d"]
        let bSet: Set<String> = ["a", "c"]
        if aSet.isSubset(of: bSet) {
            print("aSetはbSetのスーパーセットです。")
        } else {
            print("aSetはbSetのスーパーセットではありません。")
        }
    }
}
