protocol TabbarView: class {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
}
