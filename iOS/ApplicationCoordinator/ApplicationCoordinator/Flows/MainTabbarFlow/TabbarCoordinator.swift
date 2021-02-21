class TabbarCoordinator: BaseCoordinator, TabbarCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let tabbarView: UITabBarController
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: UITabBarController, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        
        let itemNavigationController = UINavigationController()
        let settingNavigationController = UINavigationController()
        
        itemNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        settingNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        
        let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: itemNavigationController)
        let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: settingNavigationController)
        
        
        self.addDependency(itemCoordinator)
        self.addDependency(settingsCoordinator)
        
        itemCoordinator.start()
        settingsCoordinator.start()
        
        settingsCoordinator.finishFlow = { [weak self, weak settingsCoordinator] in
            self?.finishFlow?()
            self?.removeDependency(settingsCoordinator)
        }
        
        tabbarView.viewControllers = [itemNavigationController, settingNavigationController]
        
    }
    
}
