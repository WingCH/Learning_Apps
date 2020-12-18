//
//  CustomTableViewCell.swift
//  Expandable-TableViewCell-StackView
//
//  Created by Akash Malhotra on 7/8/16.
//  Copyright © 2016 Akash Malhotra. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subtitleLabel : UILabel!
    @IBOutlet weak var icon : UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setValues(_ lyrics: Lyrics) {
        self.titleLabel.text = lyrics.song
        self.subtitleLabel.text = lyrics.artist
        
        // https://github.com/akashvercetti/Expandable-UITableViewCell-UIStackView
        //        In original example, need add descriptionLabel in Main.storyboard, inside to stackView
        //        let lyricsShown = lyrics.lyricsShown
        //        self.descriptionLabel.text = lyrics.lyricsSample
        //        self.descriptionLabel.isHidden = !lyricsShown
        //        self.icon.image = lyricsShown ? UIImage(named: "up") : UIImage(named: "down")
        
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = lyrics.lyricsSample
        
        stackView.addArrangedSubview(descriptionLabel)
        
        
        self.icon.image = UIImage(named: "down")
    }
}
