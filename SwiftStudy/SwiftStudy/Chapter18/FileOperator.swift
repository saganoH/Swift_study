import UIKit

class FileOperator {
    
    // テキストファイルのパスを指定
    private let thePath: String
    init(filePath: String) {
        thePath = NSHomeDirectory() + filePath
    }
    
    func save(text: String) {
        // テキストデータの保存をトライする
        do {
            try text.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    func read() -> String {
        // テキストデータの読み込みをトライする
        do {
            let readText = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            return readText
        } catch let error as NSError {
            return "読み込みに失敗。\n \(error)"
        }
    }
}
