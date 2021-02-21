final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: Coordinator & TabbarCoordinatorOutput, toPresent: Presentable?) {
        let tabbarView = UITabBarController()
        let coordinator = TabbarCoordinator(tabbarView: tabbarView, coordinatorFactory: self)
        return (coordinator, tabbarView)
    }
    
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput {
        
        let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }
    
    func makeItemCoordinator() -> Coordinator {
        return makeItemCoordinator(navController: nil)
    }
    
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(with: ModuleFactoryImp(), router: router)
    }
    
    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = ItemCoordinator(
            router: router(navController),
            factory: ModuleFactoryImp(),
            coordinatorFactory: CoordinatorFactoryImp()
        )
        return coordinator
    }
    
    func makeSettingsCoordinator() -> Coordinator & SettingsCoordinatorOutput{
        return makeSettingsCoordinator(navController: nil)
    }
    
    func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator & SettingsCoordinatorOutput{
        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactoryImp())
        return coordinator
    }
    
    func makeItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {
            
            return makeItemCreationCoordinatorBox(navController: navigationController(nil))
    }
    func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {
            
            let router = self.router(navController)
            let coordinator = ItemCreateCoordinator(router: router, factory: ModuleFactoryImp())
            return (coordinator, router)
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController() }
    }
}
