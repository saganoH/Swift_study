import Foundation

class StringSample {
    //p121 ストリングインデックス
    func stringIndex() {
        let str = "Swift入門ノート"
        let start = str.startIndex
        let end = str.endIndex
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
    
    //p124 
}
