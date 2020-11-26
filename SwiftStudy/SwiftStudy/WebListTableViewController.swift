import UIKit

class WebListTableViewController: UITableViewController {

    let webList = [
        (name: "アップル", url: "https://www.apple.com/jp/"),
        (name: "国立天文台", url: "https://www.nao.ac.jp"),
        (name: "東京都美術館", url: "http://www.tobikan.jp"),
        (name: "amazon", url: "https://www.amazon.co.jp")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // テーブルにwebListのデータを表示する
        let webData = webList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = webData.name
        cell.detailTextLabel?.text = webData.url

        return cell
    }

    // MARK: - Navigation

    // セグエで移動する前にデータを受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebPage" {
            // タップした行番号を取り出す
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // 行のデータを取り出す
                let webData = webList[(indexPath as NSIndexPath).row]
                // 移動先のビューコントローラのdataプロパティに値を設定する
                (segue.destination as! Sec14ViewController2).data = webData
            }
        }
    }

}
