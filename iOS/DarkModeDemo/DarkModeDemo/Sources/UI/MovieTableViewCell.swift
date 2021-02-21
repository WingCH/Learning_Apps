//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet  weak var titleLabel: UILabel!
    @IBOutlet  weak var descriptionLabel: UILabel!
    var themeProvider: ThemeProvider?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func prepareForReuse() {
	    super.prepareForReuse()
        apply(theme: themeProvider!.theme)
    }
}

extension MovieTableViewCell: Themeable {

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColor
	    descriptionLabel.textColor = theme.descriptionTextColor
    }

}
