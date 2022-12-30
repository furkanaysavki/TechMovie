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
        // Initialization code
    }
    
    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "" )") else {
                    return
                }
        upcomingImageView.sd_setImage(with: url)
        nameLabel.text =  model.original_title?.uppercased()
        
    }

}
