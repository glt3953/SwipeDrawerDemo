import UIKit

class MainViewController: UIViewController {
    
    // 右侧抽屉视图控制器
    private lazy var rightDrawerViewController = RightDrawerViewController()
    
    // 右侧抽屉视图
    private lazy var rightDrawerView: UIView = {
        let view = rightDrawerViewController.view!
        view.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        return view
    }()
    
    // 遮罩视图
    private lazy var dimView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black
        view.alpha = 0
        view.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    // 主视图内容
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // 标题标签
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "腾讯元宝"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    // 搜索按钮
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 新建对话按钮
    private lazy var newChatButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        button.setTitle("新建对话", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.contentHorizontalAlignment = .center
        
        let arrowImage = UIImage(systemName: "arrow.up.forward.square")
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    // 我的收藏按钮
    private lazy var favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("我的收藏", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let bookmarkImage = UIImage(systemName: "bookmark")
        button.setImage(bookmarkImage, for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    // 全部应用按钮
    private lazy var allAppsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("全部应用", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let appsImage = UIImage(systemName: "square.grid.2x2")
        button.setImage(appsImage, for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    // AI修图按钮
    private lazy var aiEditButton: UIButton = {
        let button = createAIButton(title: "AI修图", iconName: "wand.and.stars")
        return button
    }()
    
    // AI画图按钮
    private lazy var aiDrawButton: UIButton = {
        let button = createAIButton(title: "AI画图", iconName: "paintbrush")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 添加主内容视图
        view.addSubview(contentView)
        contentView.frame = view.bounds
        
        // 添加标题和搜索按钮
        contentView.addSubview(titleLabel)
        contentView.addSubview(searchButton)
        
        titleLabel.frame = CGRect(x: 20, y: 50, width: 150, height: 40)
        searchButton.frame = CGRect(x: view.bounds.width - 60, y: 50, width: 40, height: 40)
        
        // 添加新建对话按钮
        contentView.addSubview(newChatButton)
        newChatButton.frame = CGRect(x: 20, y: titleLabel.frame.maxY + 20, width: view.bounds.width - 40, height: 50)
        
        // 添加我的收藏按钮
        contentView.addSubview(favoritesButton)
        favoritesButton.frame = CGRect(x: 20, y: newChatButton.frame.maxY + 20, width: view.bounds.width - 40, height: 50)
        
        // 添加全部应用按钮
        contentView.addSubview(allAppsButton)
        allAppsButton.frame = CGRect(x: 20, y: favoritesButton.frame.maxY + 20, width: view.bounds.width - 40, height: 50)
        
        // 添加AI修图按钮
        contentView.addSubview(aiEditButton)
        aiEditButton.frame = CGRect(x: 20, y: allAppsButton.frame.maxY + 20, width: view.bounds.width - 40, height: 50)
        
        // 添加AI画图按钮
        contentView.addSubview(aiDrawButton)
        aiDrawButton.frame = CGRect(x: 20, y: aiEditButton.frame.maxY + 20, width: view.bounds.width - 40, height: 50)
        
        // 添加遮罩视图
        view.addSubview(dimView)
        
        // 添加右侧抽屉视图
        view.addSubview(rightDrawerView)
        addChild(rightDrawerViewController)
        rightDrawerViewController.didMove(toParent: self)
    }
    
    private func setupGestures() {
        // 添加右滑手势
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeRightGesture.direction = .left
        view.addGestureRecognizer(swipeRightGesture)
        
        // 添加左滑手势关闭抽屉
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeLeftGesture.direction = .right
        view.addGestureRecognizer(swipeLeftGesture)
    }
    
    private func createAIButton(title: String, iconName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        // 创建圆形背景
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        iconContainer.backgroundColor = title == "AI修图" ? UIColor.systemGreen.withAlphaComponent(0.2) : UIColor.systemYellow.withAlphaComponent(0.2)
        iconContainer.layer.cornerRadius = 18
        
        // 添加图标
        let iconImageView = UIImageView(image: UIImage(systemName: iconName))
        iconImageView.tintColor = title == "AI修图" ? .systemGreen : .systemYellow
        iconImageView.frame = CGRect(x: 8, y: 8, width: 20, height: 20)
        iconContainer.addSubview(iconImageView)
        
        // 设置布局
        button.addSubview(iconContainer)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        
        return button
    }
    
    @objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            openRightDrawer()
        } else if gesture.direction == .right {
            closeRightDrawer()
        }
    }
    
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        closeRightDrawer()
    }
    
    private func openRightDrawer() {
        // 显示遮罩
        dimView.isHidden = false
        
        UIView.animate(withDuration: 0.3) {
            // 移动右侧抽屉
            self.rightDrawerView.frame.origin.x = UIScreen.main.bounds.width * 0.2
            
            // 显示遮罩
            self.dimView.alpha = 0.5
        }
    }
    
    private func closeRightDrawer() {
        UIView.animate(withDuration: 0.3, animations: {
            // 移动右侧抽屉
            self.rightDrawerView.frame.origin.x = UIScreen.main.bounds.width
            
            // 隐藏遮罩
            self.dimView.alpha = 0
        }) { _ in
            self.dimView.isHidden = true
        }
    }
} 