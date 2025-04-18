import UIKit

class LeftDrawerViewController: UIViewController {
    
    // 滚动视图
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        return scrollView
    }()
    
    // 内容容器视图
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // 标题标签
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "左侧菜单"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    // 关闭按钮
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 头像和用户名视图
    private lazy var profileView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "用户名"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "user@example.com"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    // 主页选项
    private lazy var homeButton: UIButton = {
        return createMenuButton(title: "主页", iconName: "house")
    }()
    
    // 历史记录选项
    private lazy var historyButton: UIButton = {
        return createMenuButton(title: "历史记录", iconName: "clock")
    }()
    
    // 收藏选项
    private lazy var favoritesButton: UIButton = {
        return createMenuButton(title: "我的收藏", iconName: "star")
    }()
    
    // 设置选项
    private lazy var settingsButton: UIButton = {
        return createMenuButton(title: "设置", iconName: "gear")
    }()
    
    // 分隔线
    private func createSeparator() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let safeAreaInsets = view.safeAreaInsets
        let viewWidth = view.bounds.width
        
        // 添加滚动视图
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        
        // 添加内容容器视图
        scrollView.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: 1) // 高度先设为1，后面会根据内容调整
        
        // 添加标题
        contentView.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 50, width: viewWidth, height: 40)
        
        // 添加关闭按钮
        contentView.addSubview(closeButton)
        closeButton.frame = CGRect(x: viewWidth - 60, y: 50, width: 40, height: 40)
        
        // 添加头像和用户信息视图
        contentView.addSubview(profileView)
        profileView.frame = CGRect(x: 20, y: titleLabel.frame.maxY + 20, width: viewWidth - 40, height: 100)
        
        profileView.addSubview(avatarImageView)
        avatarImageView.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        
        profileView.addSubview(usernameLabel)
        usernameLabel.frame = CGRect(x: avatarImageView.frame.maxX + 15, y: 30, width: 150, height: 25)
        
        profileView.addSubview(emailLabel)
        emailLabel.frame = CGRect(x: avatarImageView.frame.maxX + 15, y: usernameLabel.frame.maxY + 5, width: 150, height: 20)
        
        // 添加主页选项
        contentView.addSubview(homeButton)
        homeButton.frame = CGRect(x: 20, y: profileView.frame.maxY + 30, width: viewWidth - 40, height: 50)
        
        // 添加第一条分隔线
        let separator1 = createSeparator()
        contentView.addSubview(separator1)
        separator1.frame = CGRect(x: 20, y: homeButton.frame.maxY + 10, width: viewWidth - 40, height: 1)
        
        // 添加历史记录选项
        contentView.addSubview(historyButton)
        historyButton.frame = CGRect(x: 20, y: separator1.frame.maxY + 10, width: viewWidth - 40, height: 50)
        
        // 添加第二条分隔线
        let separator2 = createSeparator()
        contentView.addSubview(separator2)
        separator2.frame = CGRect(x: 20, y: historyButton.frame.maxY + 10, width: viewWidth - 40, height: 1)
        
        // 添加收藏选项
        contentView.addSubview(favoritesButton)
        favoritesButton.frame = CGRect(x: 20, y: separator2.frame.maxY + 10, width: viewWidth - 40, height: 50)
        
        // 添加第三条分隔线
        let separator3 = createSeparator()
        contentView.addSubview(separator3)
        separator3.frame = CGRect(x: 20, y: favoritesButton.frame.maxY + 10, width: viewWidth - 40, height: 1)
        
        // 添加设置选项
        contentView.addSubview(settingsButton)
        settingsButton.frame = CGRect(x: 20, y: separator3.frame.maxY + 10, width: viewWidth - 40, height: 50)
        
        // 更新内容视图的高度
        let contentHeight = settingsButton.frame.maxY + 30
        contentView.frame.size.height = contentHeight
        
        // 设置滚动视图的内容大小
        scrollView.contentSize = CGSize(width: viewWidth, height: contentHeight)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 更新滚动视图框架以考虑安全区域
        scrollView.frame = view.bounds
        
        // 重新计算和设置内容尺寸
        let contentHeight = settingsButton.frame.maxY + 30
        contentView.frame.size.height = contentHeight
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentHeight)
    }
    
    private func createMenuButton(title: String, iconName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        // 设置图标
        let icon = UIImage(systemName: iconName)
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        
        // 调整图标和文本间距
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }
    
    @objc private func closeButtonTapped() {
        if let mainVC = parent as? MainViewController {
            // 直接调用主视图控制器的方法
            mainVC.closeLeftDrawer()
        }
    }
} 