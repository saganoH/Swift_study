class EnumSample {
    //p233 列挙型による振り分け
    func packing(size: WomenSize) -> String {
        var stuff: String
        switch size {
        case .XS, .S:
            stuff = "女性用XS、Sサイズ備品"
        case .M:
            stuff = "女性用Mサイズ備品"
        case .L:
            stuff = "女性用Lサイズ備品"
        }
        return stuff
    }
    
    //p235 Raw Valueを割り振った列挙型
    func changeCourse() {
        let course1 = Direction.forward
        let course2 = Direction.backword
        let course3 = Direction.right
        let course4 = Direction.left
        //Raw Valueを調べる
        print(course1.rawValue)
        print(course2.rawValue)
        print(course3.rawValue)
        print(course4.rawValue)
        
        let course5 = Direction(rawValue: 3)
        if let course = course5 {
            print(course)
        }
    }
    
    //p237 enumで型を列挙する
    func shirtPattern() {
        let shirt1 = Pattern.Monotone(.red)
        let shirt2 = Pattern.Border(color1: .white, color2: .red)
        let shirt3 = Pattern.Dots(base: .yellow, dot1: .white, dot2: .green)
        let patternList = [shirt1, shirt2, shirt3]
        for thePattern in patternList {
            switch thePattern {
            case .Monotone(let c):
                print("\(c.rawValue)の無地")
            case .Border(let c1, let c2):
                print("\(c1.rawValue)と\(c2.rawValue)のボーダー")
            case .Dots(let dotBase, let dot1, let dot2):
                print("\(dotBase.rawValue)地に\(dot1.rawValue)と\(dot2.rawValue)のドット")
            }
        }
    }
    
    //p240 プロパティを持つ列挙型
    func ticketType() {
        //チケット名の変更
        Ticket.name = "超ライブ入場券"
        //チケットを取得
        let ticket1 = Ticket.A
        let ticket2 = Ticket.Gold
        //チケットの確認
        print(Ticket.name, ticket1.area, ticket1.price)
        print(Ticket.name, ticket2.area, ticket2.price)
    }
    
    //p242 タイプメソッドとインスタンスメソッドを持つ列挙型
    func signalController() {
        let text = Signal.description()
        print(text)
        
        //Greenで開始
        var lamp = Signal.Green
        print(lamp.color)
        print(lamp.isRun())
        print("----値を反転する----")
        lamp.changeSignal()
        print(lamp.color)
        print(lamp.isRun())
    }
}

enum WomenSize {
    case XS, S, M, L
}

enum Direction: Int {
    case forward = 1
    case backword
    case right
    case left
}

enum Pattern {
    case Monotone(_: PColor)
    case Border(color1: PColor, color2: PColor)
    case Dots(base: PColor, dot1: PColor, dot2: PColor)
    
    enum PColor: String {
        case red = "赤"
        case green = "緑"
        case yellow = "黄"
        case white = "白"
    }
}

enum Ticket {
    //チケットの種類
    case Gold, A, B
    //タイププロパティ
    static var name = "入場券"
    
    //席（リードオンリー）
    var area: String {
        get {
            switch self {
            case .Gold:
                return "ゴールド席"
            case .A:
                return "A席"
            case .B:
                return "B席"
            }
        }
    }
    
    //価格（リードオンリー）
    var price: Int {
        get {
            switch self {
            case .Gold:
                return 24000
            case .A:
                return 5000
            case .B:
                return 2000
            }
        }
    }
}

enum Signal: String {
    case Green = "緑色"
    case Red = "赤色"
    
    //値を色名(Raw value)で返す
    var color: String {
        return self.rawValue
    }
    
    //説明文を返すタイプメソッド
    static func description() -> String {
        return "GreenまたはRedのシグナルです。"
    }
    
    //Greenの時はtrue、それ以外の時はfalse
    func isRun() -> Bool {
        if self == .Green {
            return true
        } else {
            return false
        }
    }
    
    //GreenとRedの値を切り替える
    mutating func changeSignal() {
        if self == .Green {
            self = .Red
        } else {
            self = .Green
        }
    }
}
