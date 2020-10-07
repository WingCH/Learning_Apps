protocol SettingsCoordinatorOutput: class {
    var finishFlow: (() -> Void)? { get set }
}
