//
//  TrendCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 17.12.2022.
//

import UIKit
import Gemini

class DiscoverCollectionViewCell: GeminiCell {

    
   
    @IBOutlet weak var trendImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
               
       
    }
    func configure(with model: Title ) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
        trendImageView.sd_setImage(with: url)
        
    }

}
