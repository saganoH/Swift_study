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
}

enum WomenSize {
    case XS, S, M, L
}
