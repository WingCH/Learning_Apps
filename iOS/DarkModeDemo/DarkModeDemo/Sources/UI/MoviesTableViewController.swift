//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var themeProvider: ThemeProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        themeProvider?.register(observer: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSetting" {
            if let viewController = segue.destination as? SettingsViewController {
                viewController.themeProvider = themeProvider
            }
        }
    }
}

extension MoviesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        
        cell.themeProvider = themeProvider
        cell.titleLabel.text = "Row"
        cell.descriptionLabel.text = "\(indexPath.row)"
        themeProvider?.register(observer: cell)
        
        return cell
        
    }
}

extension MoviesTableViewController: Themeable {
    func apply(theme: Theme) {
        tableView.backgroundColor = theme.tableViewBackground
        tableView.separatorColor = theme.separatorColor
    }
}
