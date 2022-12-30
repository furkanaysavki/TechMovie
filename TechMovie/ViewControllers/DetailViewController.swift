//
//  DetailViewController.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 25.12.2022.
//

import UIKit
import RxSwift
import RxCocoa
import WebKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

   
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var castCollectionView: UICollectionView!
    @IBOutlet weak var recommendationCollectionView: UICollectionView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var nameLabel: UILabel!
    private var viewModel = DetailViewModel()

    var disposeBag = DisposeBag()
    var id = Int()
    var query = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindingUI()
        bindingCast()
        bindingRecommendations()
        registerCells()
        
    }

    private func registerCells(){
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollectionViewCell")
        recommendationCollectionView.register(UINib(nibName: "RecommendationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecommendationCollectionViewCell")
    }

}
extension DetailViewController {
    
    private func bindingUI() {
        
        viewModel.getDetails(id: id)
        viewModel.detailMovie.bind { movieDetail in
            self.overviewLabel.text = movieDetail.overview
            self.nameLabel.text = movieDetail.originalTitle
            
        } .disposed(by: disposeBag)
        
        viewModel.getMovieYoutube(query: query + "trailer")
        viewModel.youtubeTrailer.bind { youtube in
            
            guard let url = URL(string: "https://www.youtube.com/embed/\(youtube.id.videoId)") else {
                return
            }
            
            self.webView.load(URLRequest(url: url))
        }.disposed(by: disposeBag)
        }
        
    private func bindingCast() {
        
        self.viewModel.getCastData(id: id)
        castCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.castData.bind(to: castCollectionView.rx.items(cellIdentifier: "CastCollectionViewCell", cellType: CastCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item )
           
        } .disposed(by: disposeBag)
        
    }
    private func bindingRecommendations() {
        
        self.viewModel.getRecommendations(id: id)
        recommendationCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.recommendation.bind(to: recommendationCollectionView.rx.items(cellIdentifier: "RecommendationCollectionViewCell", cellType: RecommendationCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item )
           
        } .disposed(by: disposeBag)
        recommendationCollectionView.rx.modelSelected(Title.self)
            .subscribe { movie in
                let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                detailVC.id = movie.id
                detailVC.query = (movie.original_title)?.replacingOccurrences(of: " ", with: "+") ?? movie.original_name!
                
                self.navigationController?.pushViewController(detailVC, animated: true)
                
            }.disposed(by: disposeBag)
        
    }
}



