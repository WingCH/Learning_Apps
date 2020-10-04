@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var rootController: UINavigationController {
    return self.window!.rootViewController as! UINavigationController
  }
  
    // https://medium.com/wolox/ios-deep-linking-url-scheme-vs-universal-links-50abd3802f97
    // URL Scheme:  com.myApp://xxx
    // Quick way to open a Custom URL Scheme in iOS Simulator
    // https://sarunw.com/posts/quick-way-to-open-custom-url-scheme-in-ios-simulator/
  private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let scheme = url.scheme,
            scheme.localizedCaseInsensitiveCompare("com.myApp") == .orderedSame,
            let view = url.host {
            
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }
            
            print(view);
            print(parameters);
            applicationCoordinator.start(with: DeepLinkOption.onboarding)
        }
        return true
    }
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
    let deepLink = DeepLinkOption.build(with: notification)
    applicationCoordinator.start(with: deepLink)
    return true
  }
  
  private func makeCoordinator() -> Coordinator {
      return ApplicationCoordinator(
        router: RouterImp(rootController: self.rootController),
        coordinatorFactory: CoordinatorFactoryImp()
      )
  }
  
  //MARK: Handle push notifications and deep links
  func application(_ application: UIApplication,
                   didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    let dict = userInfo as? [String: AnyObject]
    let deepLink = DeepLinkOption.build(with: dict)
    applicationCoordinator.start(with: deepLink)
  }
  
  func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                   restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    let deepLink = DeepLinkOption.build(with: userActivity)
    applicationCoordinator.start(with: deepLink)
    return true
  }
}
