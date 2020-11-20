import UIKit

class Sec13ViewController6: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 写真のファイル名とタイトルの構造体(Photoタイプ）
    struct Photo {
        var imageName: String
        var title: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 各ページに表示する写真
        let photoList = [
            Photo(imageName: "momiji", title: "中島公園の紅葉"),
            Photo(imageName: "christmas", title: "クリスマスツリー"),
            Photo(imageName: "icho", title: "銀杏"),
            Photo(imageName: "kurigohan", title: "栗ごはん")
        ]
        
        // サブビュー
        let subView = createContentsView(contentList: photoList)
        // スクロールビューにサブビューを追加する
        scrollView.addSubview(subView)
        
        // スクロールビューの設定
        scrollView.isPagingEnabled = true // ページ送りする
        scrollView.contentSize = subView.frame.size // コンテンツサイズ
        scrollView.contentOffset = CGPoint(x: 0, y: 0) // スクロール開始位置
        // スクロールビューのデリゲートになる
        scrollView.delegate = self
        
        // ページコントロールの設定
        pageControl.numberOfPages = photoList.count // ページ総数
        pageControl.currentPage = 0 // スタート位置
        //ページコントロールのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func createPage(viewRect: CGRect, imageSize: CGSize, item: Photo) -> UIView {
        let pageView = UIView(frame: viewRect)
        // 写真ビューを作ってイメージを設定する
        let photoView = UIImageView()
        let left = (pageView.frame.width - imageSize.width) / 2
        photoView.frame = CGRect(x: left, y: 10, width: imageSize.width, height: imageSize.height)
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: item.imageName)
        // ラベルを作って写真タイトルを設定する
        let titleFrame = CGRect(x: left, y: photoView.frame.maxY+10, width: 200, height: 21)
        let titleLabel = UILabel(frame: titleFrame)
        titleLabel.text = item.title
        // 写真とタイトルとページビューに追加する
        pageView.addSubview(photoView)
        pageView.addSubview(titleLabel)
        
        return pageView
    }
    
    private func createContentsView(contentList: Array<Photo>) -> UIView {
        // ページを追加するコンテンツビューを作る
        let contentView = UIView()
        // 1ページの幅と高さ
        let pageWidth = self.view.frame.width
        let pageHeight = scrollView.frame.height
        let pageViewRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        // 写真の縦横サイズ
        let photoSize = CGSize(width: 250, height: 250)
        // ページを並べたコンテンツビュー全体のサイズ
        contentView.frame = CGRect(x: 0, y: 0, width: pageWidth*4, height: pageHeight)
        // ページの背景色
        let colors: Array<UIColor> = [.cyan, .yellow, .lightGray, .orange]
        
        // 写真コンテンツのページを作ってサブビューに追加する
        for i in 0..<contentList.count {
            // 写真のファイル名とタイトルを順番に取り出す
            let contentItem = contentList[i]
            // ページのビューを作る
            let pageView = createPage(viewRect: pageViewRect, imageSize: photoSize, item: contentItem)
            // ページの表示座標を決める
            let left = pageViewRect.width * CGFloat(i)
            let xy = CGPoint(x: left, y: 0)
            pageView.frame = CGRect(origin: xy, size: pageViewRect.size)
            pageView.backgroundColor = colors[i]
            
            // コンテンツビューにページビューを並べて追加していく
            contentView.addSubview(pageView)
        }
        return contentView
    }
    
    // スクロールしたらページコントロールを更新する
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // カレントページを調べる
        let pageNo = Int(scrollView.contentOffset.x/scrollView.frame.width)
        // 表示をカレントページに合わせる
        pageControl.currentPage = pageNo
    }
}
