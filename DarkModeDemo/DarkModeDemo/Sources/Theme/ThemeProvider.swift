//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

protocol ThemeProvider: class {
    // use for set overrideUserInterfaceStyle
    var window: UIWindow { get }
    var theme: Theme { get }
    func register<Observer: Themeable>(observer: Observer)
    func updateThemeStyle(type: ThemeType)
}

class LegacyThemeProvider: ThemeProvider {
    var window: UIWindow
    
    var theme: Theme {
        didSet {
//            UserDefaults.standard.set(theme == .dark, forKey: "isDark")
            notifyObservers()
        }
    }
    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
    init(window: UIWindow) {
        self.theme = UserDefaults.standard.bool(forKey: "isDark") ? .dark : .light
        self.window = window
    }
    
    
    func updateThemeStyle(type: ThemeType) {
        switch type {
        case .light:
            theme = .light
        case .dark:
            theme = .dark
        case .adaptive:
            if #available(iOS 13.0, *) {
                theme = .adaptive
            } else {
                assertionFailure("The function shouldn't be used if iOS < 13")
            }
        }
    }
    
    func register<Observer: Themeable>(observer: Observer) {
        observer.apply(theme: theme)
        self.observers.add(observer)
    }
    
    private func notifyObservers() {
        DispatchQueue.main.async {
            self.observers.allObjects
                .compactMap({ $0 as? Themeable })
                .forEach({ $0.apply(theme: self.theme) })
        }
    }
}

//@available(iOS 13.0, *)
//public class DefaultThemeProvider: NSObject, ThemeProvider {
//    let theme: Theme = .adaptive
//    
//    override init() {
//        super.init()
//    }
//    
//    func register<Observer: Themeable>(observer: Observer) {
//        observer.apply(theme: theme)
//    }
//    
//    func toggleTheme() {
//        assertionFailure("The function \(DefaultThemeProvider.self).\(#function) shouldn't be used!")
//    }
//}
