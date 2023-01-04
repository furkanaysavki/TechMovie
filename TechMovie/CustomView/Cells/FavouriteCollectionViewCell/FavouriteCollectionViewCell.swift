//
//  FavouriteCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 3.01.2023.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 20.0
    }

    func configure(with model: FavouriteMovie) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path)") else {
                    return
                }
        imageView.sd_setImage(with: url)
        nameLabel.text =  model.original_title.uppercased()
        
    }

}
