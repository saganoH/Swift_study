class RandomPresenter {
    
    func chapterDecider() -> String {
        let randomC = Random()
        var chapterName = ""
        
        switch randomC.random() {
        case 1:
            chapterName = "chapter11"
        case 2:
            chapterName = "chapter12"
        case 3:
            chapterName = "chapter13"
        case 4:
            chapterName = "chapter14"
        case 5:
            chapterName = "chapter15"
        case 6:
            chapterName = "chapter16"
        case 7:
            chapterName = "chapter18"
        case 8:
            chapterName = "chapter19-1"
        default:
            chapterName = "notDecided"
        }
        print(chapterName)
        return chapterName
    }
}
