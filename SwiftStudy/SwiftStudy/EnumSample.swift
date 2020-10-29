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


