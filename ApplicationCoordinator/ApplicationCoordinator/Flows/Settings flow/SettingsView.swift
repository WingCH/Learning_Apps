protocol SettingsView: BaseView {
    var onLogout: (() -> Void)? { get set }
}

