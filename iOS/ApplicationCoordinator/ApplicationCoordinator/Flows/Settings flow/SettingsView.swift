protocol SettingsView: BaseView {
    var onLogout: (() -> Void)? { get set }
    var onItemSelect: ((Int) -> ())? { get set }
}

