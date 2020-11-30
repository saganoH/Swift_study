//p207 プロパティオブザーバー
class Player {
    var times = 0
    var level: Int {
        willSet {
            print("----------")
            print("willSet \(newValue)")
        }
        didSet {
            if oldValue != level {
                times += 1
                print("\(times)回目の更新")
                print("\(oldValue) → \(level)")
            } else {
                print("値は変化なし")
            }
        }
    }
    
    init() {
        level = 0
    }
}
