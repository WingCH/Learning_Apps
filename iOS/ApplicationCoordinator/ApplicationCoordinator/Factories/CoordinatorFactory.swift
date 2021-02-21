protocol CoordinatorFactory {
  
  func makeTabbarCoordinator() -> (configurator: Coordinator & TabbarCoordinatorOutput, toPresent: Presentable?)
  func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput
  
  func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
  
  func makeItemCoordinator(navController: UINavigationController?) -> Coordinator
  func makeItemCoordinator() -> Coordinator
  
  func makeSettingsCoordinator() -> Coordinator & SettingsCoordinatorOutput
  func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator & SettingsCoordinatorOutput
  
  func makeItemCreationCoordinatorBox() ->
    (configurator: Coordinator & ItemCreateCoordinatorOutput,
    toPresent: Presentable?)
  
  func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
    (configurator: Coordinator & ItemCreateCoordinatorOutput,
    toPresent: Presentable?)
}
