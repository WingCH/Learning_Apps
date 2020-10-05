class TabbarCoordinator: BaseCoordinator, TabbarCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runItemFlow()
        tabbarView.onItemFlowSelect = runItemFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    //    private func runItemFlow() -> ((UINavigationController) -> ()) {
    private func runItemFlow() -> (() -> ()) {
        return {
            //            if navController.viewControllers.isEmpty == true {
            //                let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
            let itemCoordinator = self.coordinatorFactory.makeItemCoordinator()
            self.addDependency(itemCoordinator)
            itemCoordinator.start()
            //            }
        }
    }
    
    //    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
    private func runSettingsFlow() -> (() -> ()) {
        return {
            //            if navController.viewControllers.isEmpty == true {
            //                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
            let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator()
            
            settingsCoordinator.finishFlow = { [weak self, weak settingsCoordinator] in
                self?.finishFlow?()
                self?.removeDependency(settingsCoordinator)
            }
            
            self.addDependency(settingsCoordinator)
            settingsCoordinator.start()
            //            }
        }
    }
}
