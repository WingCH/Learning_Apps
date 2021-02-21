//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet private weak var defaultCell: UITableViewCell!
    @IBOutlet private weak var lightCell: UITableViewCell!
    @IBOutlet private weak var darkCell: UITableViewCell!
    
    private let defaultThemeSwitch = UISwitch()
    private let lightThemeSwitch = UISwitch()
    private let darkThemeSwitch = UISwitch()
    
    var themeProvider: ThemeProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultThemeSwitch.addTarget(self, action: #selector(didTap(switchView:)), for: .valueChanged)
        defaultCell.accessoryView = defaultThemeSwitch
        
        lightThemeSwitch.addTarget(self, action: #selector(didTap(switchView:)), for: .valueChanged)
        lightCell.accessoryView = lightThemeSwitch
        
        darkThemeSwitch.addTarget(self, action: #selector(didTap(switchView:)), for: .valueChanged)
        darkCell.accessoryView = darkThemeSwitch
        
        tableView.tableFooterView = UIView()
        themeProvider?.register(observer: self)
    }
    
    @objc func didTap(switchView: UISwitch) {
        switch switchView {
        case defaultThemeSwitch:
            if defaultThemeSwitch.isOn {
                lightThemeSwitch.setOn(false, animated: true)
                darkThemeSwitch.setOn(false, animated: true)
                if #available(iOS 13.0, *) {
                    themeProvider?.updateThemeStyle(type: .adaptive)
                } else {
                    assertionFailure("The function shouldn't be used if iOS < 13")
                }
            }else{
                lightThemeSwitch.setOn(true, animated: true)
                themeProvider?.updateThemeStyle(type: .light)
            }
            break
        case lightThemeSwitch:
            if lightThemeSwitch.isOn {
                defaultThemeSwitch.setOn(false, animated: true)
                darkThemeSwitch.setOn(false, animated: true)
                themeProvider?.updateThemeStyle(type: .light)
            }else{
                if #available(iOS 13.0, *) {
                    defaultThemeSwitch.setOn(true, animated: true)
                    themeProvider?.updateThemeStyle(type: .adaptive)
                } else {
                    darkThemeSwitch.setOn(true, animated: true)
                    themeProvider?.updateThemeStyle(type: .dark)
                }
            }
            break
        case darkThemeSwitch:
            if darkThemeSwitch.isOn {
                defaultThemeSwitch.setOn(false, animated: true)
                lightThemeSwitch.setOn(false, animated: true)
                themeProvider?.updateThemeStyle(type: .dark)
            }else{
                if #available(iOS 13.0, *) {
                    defaultThemeSwitch.setOn(true, animated: true)
                    themeProvider?.updateThemeStyle(type: .adaptive)
                } else {
                    lightThemeSwitch.setOn(true, animated: true)
                    themeProvider?.updateThemeStyle(type: .light)
                }
            }
            break
        default:
            break
        }
        
    }
}

extension SettingsViewController: Themeable {
    func apply(theme: Theme) {
        tableView.backgroundColor = theme.tableViewBackground
        tableView.separatorColor = theme.separatorColor
        
        defaultCell.backgroundColor = theme.backgroundColor
        defaultCell.textLabel?.textColor = theme.textColor
        defaultThemeSwitch.onTintColor = theme.switchTintColor
        
        if #available(iOS 13.0, *) {
            defaultThemeSwitch.isOn = theme == .adaptive
        } else {
            defaultThemeSwitch.isEnabled  = false
        }
        
        lightCell.backgroundColor = theme.backgroundColor
        lightCell.textLabel?.textColor = theme.textColor
        lightThemeSwitch.onTintColor = theme.switchTintColor
        lightThemeSwitch.isOn = theme == .light
        
        darkCell.backgroundColor = theme.backgroundColor
        darkCell.textLabel?.textColor = theme.textColor
        darkThemeSwitch.onTintColor = theme.switchTintColor
        darkThemeSwitch.isOn = theme == .dark
    }
    
}
