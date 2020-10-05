final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: SettingsModuleFactory
    private let router: Router
    
    init(router: Router, factory: SettingsModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showSettings() {
        let settingsFlowOutput = factory.makeSettingsOutput()
        settingsFlowOutput.onLogout = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(settingsFlowOutput)
    }
}
