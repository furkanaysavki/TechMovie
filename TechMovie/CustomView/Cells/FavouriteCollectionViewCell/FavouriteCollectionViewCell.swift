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
        
        
    }

    func configure(with model: FavouriteMovie) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path)") else {
                    return
                }
        imageView.sd_setImage(with: url)
        nameLabel.text =  model.original_title.uppercased()
        
    }

}
