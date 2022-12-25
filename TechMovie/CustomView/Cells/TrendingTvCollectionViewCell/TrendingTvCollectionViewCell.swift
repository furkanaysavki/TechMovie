//
//  TrendingTvCollectionView.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 19.12.2022.
//

import UIKit

class TrendingTvCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var trendingTvImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
        trendingTvImageView.sd_setImage(with: url)
       tvName.text = model.original_name?.uppercased()
    }

}
