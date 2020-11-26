import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 2番目のタブにバッジ"new"をつける
        let tabBarItem = tabBar.items?[1]
        tabBarItem?.badgeValue = "new"
    }
    
    // タブバーが切り替わると実行される
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // ２番目のタブだった時バッジを消す
        if item.title == tabBar.items?[1].title {
            item.badgeValue = nil
        }
    }
    
}
