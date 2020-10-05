protocol TabbarView: class {
    //    var onItemFlowSelect: ((UINavigationController) -> ())? { get set }
    //    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
    //    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onItemFlowSelect: (() -> ())? { get set }
    var onSettingsFlowSelect: (() -> ())? { get set }
    var onViewDidLoad: (() -> ())? { get set }
}
