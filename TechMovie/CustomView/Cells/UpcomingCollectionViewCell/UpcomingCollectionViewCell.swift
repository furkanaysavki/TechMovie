//
//  UpcomingCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 20.12.2022.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var upcomingImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 20.0
    }
    
    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "" )") else {
                    return
                }
        upcomingImageView.sd_setImage(with: url)
        nameLabel.text =  model.original_title?.uppercased()
        
    }

}
