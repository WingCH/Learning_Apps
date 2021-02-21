//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class StyleableNavigationController: UINavigationController {
    
    var themeProvider: ThemeProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeProvider?.register(observer: self)
    }
}

extension StyleableNavigationController: Themeable {
    func apply(theme: Theme) {
        //導航欄的背景色 https://www.cnblogs.com/Ray-liang/p/4939737.html
        navigationBar.barTintColor = theme.backgroundColor
        navigationBar.barStyle = theme.navbarStyle
        navigationBar.tintColor = theme.navbarTintColor
        let textAttributes = [NSAttributedString.Key.foregroundColor:theme.textColor]
        navigationBar.titleTextAttributes = textAttributes
    }
}
