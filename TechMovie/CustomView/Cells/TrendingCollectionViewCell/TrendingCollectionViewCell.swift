//
//  TrendingCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 19.12.2022.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var trendingImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: Title) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
        trendingImageView.sd_setImage(with: url)
    }

}
