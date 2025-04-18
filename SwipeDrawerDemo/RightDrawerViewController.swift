import UIKit

class RightDrawerViewController: UIViewController {
    
    // 标题标签
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "右侧抽屉"
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
    
    // 设置选项
    private lazy var settingsButton: UIButton = {
        return createMenuButton(title: "设置", iconName: "gear")
    }()
    
    // 个人中心选项
    private lazy var profileButton: UIButton = {
        return createMenuButton(title: "个人中心", iconName: "person.circle")
    }()
    
    // 消息通知选项
    private lazy var notificationsButton: UIButton = {
        return createMenuButton(title: "消息通知", iconName: "bell")
    }()
    
    // 帮助中心选项
    private lazy var helpButton: UIButton = {
        return createMenuButton(title: "帮助中心", iconName: "questionmark.circle")
    }()
    
    // 深色模式开关
    private lazy var darkModeSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(darkModeSwitchChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    // 深色模式标签
    private lazy var darkModeLabel: UILabel = {
        let label = UILabel()
        label.text = "深色模式"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
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
        
        // 添加标题
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 40)
        
        // 添加关闭按钮
        view.addSubview(closeButton)
        closeButton.frame = CGRect(x: 20, y: 50, width: 40, height: 40)
        
        // 添加设置选项
        view.addSubview(settingsButton)
        settingsButton.frame = CGRect(x: 20, y: titleLabel.frame.maxY + 30, width: view.bounds.width - 40, height: 50)
        
        // 添加第一条分隔线
        let separator1 = createSeparator()
        view.addSubview(separator1)
        separator1.frame = CGRect(x: 20, y: settingsButton.frame.maxY + 10, width: view.bounds.width - 40, height: 1)
        
        // 添加个人中心选项
        view.addSubview(profileButton)
        profileButton.frame = CGRect(x: 20, y: separator1.frame.maxY + 10, width: view.bounds.width - 40, height: 50)
        
        // 添加第二条分隔线
        let separator2 = createSeparator()
        view.addSubview(separator2)
        separator2.frame = CGRect(x: 20, y: profileButton.frame.maxY + 10, width: view.bounds.width - 40, height: 1)
        
        // 添加消息通知选项
        view.addSubview(notificationsButton)
        notificationsButton.frame = CGRect(x: 20, y: separator2.frame.maxY + 10, width: view.bounds.width - 40, height: 50)
        
        // 添加第三条分隔线
        let separator3 = createSeparator()
        view.addSubview(separator3)
        separator3.frame = CGRect(x: 20, y: notificationsButton.frame.maxY + 10, width: view.bounds.width - 40, height: 1)
        
        // 添加帮助中心选项
        view.addSubview(helpButton)
        helpButton.frame = CGRect(x: 20, y: separator3.frame.maxY + 10, width: view.bounds.width - 40, height: 50)
        
        // 添加第四条分隔线
        let separator4 = createSeparator()
        view.addSubview(separator4)
        separator4.frame = CGRect(x: 20, y: helpButton.frame.maxY + 10, width: view.bounds.width - 40, height: 1)
        
        // 添加深色模式开关
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeSwitch)
        
        darkModeLabel.frame = CGRect(x: 20, y: separator4.frame.maxY + 20, width: 100, height: 30)
        darkModeSwitch.frame = CGRect(x: view.bounds.width - 70, y: separator4.frame.maxY + 20, width: 51, height: 31)
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
            mainVC.closeRightDrawer()
        }
    }
    
    @objc private func darkModeSwitchChanged(_ sender: UISwitch) {
        // 这里可以实现深色模式切换的逻辑
        print("深色模式: \(sender.isOn ? "开启" : "关闭")")
    }
} 