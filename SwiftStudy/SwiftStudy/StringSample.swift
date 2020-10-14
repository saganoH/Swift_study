import Foundation

class StringSample {
    //p121 ストリングインデックス
    func stringIndex() {
        let str = "Swift入門ノート"
        let start = str.startIndex
        let end = str.index(before: str.endIndex)
        print(start)
        print(str[start])
        print(end)
        print(str[end])
    }
    
    //p122 ひとつ先のインデックス
    func indexAfter() {
        let str = "Swift入門ノート"
        var index = str.startIndex
        index = str.index(after: index)
        print(str[index])
    }
    
    //p123 指定の位置の文字の取り出し
    func indexOffsetBy() {
        let str = "Swift入門ノート"
        //先頭から５番目
        let index1 = str.index(str.startIndex, offsetBy: 5)
        //末尾から４番目
        let index2 = str.index(str.endIndex, offsetBy: -4)
        
        let chr1 = str[index1]
        let chr2 = str[index2]
        print((chr1, chr2))
    }
    
    //p123 インデックスの範囲指定
    func stringRangeOperator() {
        let str = "Swift入門ノート"
        let zero = str.startIndex
        let start = str.index(zero, offsetBy: 3)
        let end = str.index(zero, offsetBy: 6)
        print(str[start...end], str[start..<end])
    }
    
    //p124　先頭文字を大文字にする
    func stringCap(_ str: String) -> String {
        let start = str.startIndex
        let chr = str[start]
        let str1 = String(chr)
        let second = str1.index(after: start)
        let str2 = str[second...]
        let capStr = str1.uppercased() + str2.lowercased()
        return capStr
    }
    
    //p126　ストリングの比較
    func stringCompare() {
        let str0 = "Swift入門"
        let str1 = "SWIFT入門"
        let str2 = "Swift" + "入門"
        
        if str0 == str1 {
            print("str0とstr1は同じです。")
        } else {
            print("str0とstr1は同じではありません。")
        }
        if str0 == str2 {
            print("str0とstr2は同じです。")
        } else {
            print("str0とstr2は同じではありません。")
        }
    }
    
    //p127　ストリングの大小
    func stringBigger() {
        let str1 = "iPad"
        let str2 = "iPhone"
        
        if str1 > str2 {
            print("\(str1)のほうが\(str2)より大きい")
        } else if str1 < str2 {
            print("\(str2)のほうが\(str1)より大きい")
        } else {
            print("\(str1)と\(str2)は同じ")
        }
    }
    
    //p127　大文字と小文字を区別せずに比較する
    func stringCompareCase() {
        let str1 = "apple"
        let str2 = "Apple"
        if str1.lowercased() == str2.lowercased() {
            print("\(str1)と\(str2)は同じです。")
        } else {
            print("\(str1)と\(str2)は同じではありません。")
        }
    }
    
    //p128　前方一致
    func stringHasPrefix() {
        let itemList = ["カツ丼", "カツカレー", "親子丼", "天丼"]
        var menu1 = [String] ()
        var menu2 = [String] ()
        for item in itemList {
            if item.hasPrefix("カツ") {
                menu1.append(item)
            }
            if item.hasSuffix("丼") {
                menu2.append(item)
            }
        }
        print(menu1)
        print(menu2)
    }
    
    //p129　ストリングに含まれているかどうか
    func stringContains() {
        let str1 = "吾輩は黒猫である。"
        let str2 = "黒猫"
        if str1.contains(str2) {
            print("「\(str2)」が含まれています。")
        } else {
            print("「\(str2)は含まれていません。")
        }
    }
    
    //p129　後ろを取り出す
    func rangeSubstring() {
        let address = "東京都千代田区神南1-2-3"
        let result = address.range(of: "東京都")
        if let theRange = result {
            let afterStr = address[theRange.upperBound...]
            print(afterStr)
        } else {
            print(address)
        }
    }
    
    //p130 見つかった範囲を削除する
    func stringRemove() {
        var address = "東京都千代田区神南1-2-3"
        let result = address.range(of: "東京都")
        if let theRange = result {
            address.removeSubrange(theRange)
        }
        print(address)
    }
}
