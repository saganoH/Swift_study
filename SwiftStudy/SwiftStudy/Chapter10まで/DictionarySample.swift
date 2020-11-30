class DictionarySample{
    //p150 辞書を作る
    func dictionarySample() {
        let sizeTable = ["S":47, "M":52, "L":55]
        let numDic = [10:"a", 20:"b", 30:"c"]
        let resultDic = ["A":true, "B":false, "C":true]
        let pointDic = ["p1":(10, 20), "p2":(30, 50), "p3":(20, 40)]
        print(sizeTable)
        print(numDic)
        print(resultDic)
        print(pointDic)
    }
    
    //p151　空の辞書、タプル×辞書
    func dictionaryEmpty() {
        var sizeTable: [String: Int] = [:]
        var theUser: [String: String]
        theUser = [:]

        sizeTable = [String: Int]()
        theUser =
        Dictionary<String, String>()

        if sizeTable.isEmpty {
            print("sizeTableは空の辞書です")
            if theUser.isEmpty {
                print("theUserも空の辞書です")
            }
        }

        print("sizeTableの要素数は\(sizeTable.count)個です")
        
        let a = ("A", 1)
        let b = ("B", 2)
        let c = ("C", 3)
        let abcDic = Dictionary(dictionaryLiteral: a, b, c)
        print(abcDic)
    }

    //p154 辞書から値を取り出す
    func dictionaryAccess() {
        var members = ["東京": 15, "大阪": 12, "札幌": 9]
        let tokyoValue = members["東京"]
        //print(tokyoValue)
        //nilかもしれない値＝オプショナルバリュー
        //オプショナルバリューはnilじゃないことを明示的に示す必要がある
        print(tokyoValue!)

        members["大阪"] = 17
        print(members)
    }
    
    //p156 更新された値を知る、値を追加・削除する
    func updateMembers(theKey: String, newValue: Int) {
        var members = [String: Int]()
        members = ["東京": 15, "大阪": 12, "札幌": 9]
        if let oldValue = members.updateValue(newValue, forKey: theKey) {
            //キーがあったときは値を更新
            print("\(theKey)の値を\(oldValue)から\(newValue)に更新しました。")
        } else {
            //キーがなかったときは要素を追加
            print("\(theKey): \(newValue)を追加しました。")
        }
        print(members)

        //更新or追加したものを削除する
        if let result = members.removeValue(forKey: theKey) {
            print("\(theKey)は削除しました。値は\(result)でした。")
        }
        print(members)
    }

    //p157 辞書の複製:参照ではなく複製
    func dictionaryCopy() {
        var dic1 = ["a": 1, "b": 2, "c": 3]
        let dic2 = dic1
        dic1["b"] = 99
        print(dic1)
        print(dic2)
    }

    //p157 要素を取り出す
    func dictionaryForIn() {
        let tokyoMetro = ["G": "銀座線", "M": "丸ノ内線", "H": "日比谷線", "T": "東西線", "C": "千代田線", "Z": "半蔵門線", "N": "南北線", "F": "副都心線"]
        for rosen in tokyoMetro {
            print(rosen)
        }
        for (rosenSign, rosenName) in tokyoMetro {
            print("\(rosenSign)は\(rosenName)です。")
        }

        let rosenSigns = Array(tokyoMetro.keys)
        print(rosenSigns)

        let rosenNames = Array(tokyoMetro.values)
        print(rosenNames)
    }

    //p161 辞書の要素の追加と削除
    func dictionaryRemove() {
        var theRace = ["short": 20, "half": 40, "long": 85]
        //値をnilにすると要素そのものが削除される
        theRace["short"] = nil
        print(theRace)

        //全ての要素を削除して空にする
        theRace.removeAll()
        print(theRace)
    }
}
