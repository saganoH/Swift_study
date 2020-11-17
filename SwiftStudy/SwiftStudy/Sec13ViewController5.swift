import UIKit

let sectionTitle = ["チョウ目", "バッタ目", "コウチュウ目"]
let section0 = [("キタテハ", "タテハチョウ科"), ("クロアゲハ", "アゲハチョウ科")]
let section1 = [("キリギリス", "キリギリス科"), ("ヒナバッタ", "バッタ科"), ("マツムシ", "マツムシ科")]
let section2 = [("ハンミョウ", "ハンミョウ科"), ("アオオサムシ", "オサムシ科"), ("チビクワガタ", "クワガタムシ科")]
let tableData = [section0, section1, section2]

class Sec13ViewController5: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //テーブルビューを作る
        let myTableView: UITableView
        myTableView = UITableView(frame: view.frame, style: .grouped)
        //テーブルビューのデリゲートを設定する
        myTableView.delegate = self
       //テーブルビューのデータソースを設定する
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }
    
    //UITableViewDataSourseプロトコル
    //セクションの個数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    //セクションごとの行数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = tableData[section]
        return sectionData.count
    }
    
    //セクションのタイトルを決める
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    //セルを作る
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellData.0
        cell.detailTextLabel?.text = cellData.1
        return cell
    }
    //UITableViewDelegateメソッド
    //行がタップされると実行される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = sectionTitle[indexPath.section]
        let sectionData = tableData[indexPath.section]
        let cellData = sectionData[indexPath.row]
        print("\(title) \(cellData.1)")
        print("\(cellData.0)")
    }
}
