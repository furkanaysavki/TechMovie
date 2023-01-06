//
//  FavouriteViewController.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import UIKit
import RxSwift
import RxCocoa

class FavouriteViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    private var viewModel = FavouriteViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
       
       // navigationController()
        bindFavouriteCollectionCell()
        registerCell()
    }
    
    func navigationController() {
        
        title = "Favourite List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .black
    }
    

    private func registerCell() {
        
        favouriteCollectionView.register(UINib(nibName: "FavouriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavouriteCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFavouriteMovie()
        
    }
}
extension FavouriteViewController {
    
    private func bindFavouriteCollectionCell() {
        
        favouriteCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.favouriteMovie.bind(to: favouriteCollectionView.rx.items(cellIdentifier: "FavouriteCollectionViewCell", cellType: FavouriteCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item )
            cell.likeButton.addTapGesture {
                RealmHelper.sharedInstance.deleteFromDb(movie: item)
                self.viewModel.getFavouriteMovie()
            }
            self.favoriMovieStatus(cell: cell, model: item)
            
        }.disposed(by: disposeBag)
        
        favouriteCollectionView.rx.modelSelected(FavouriteMovie.self)
            .subscribe { movie in
                let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                detailVC.id = movie.id
                detailVC.query = (movie.original_title).replacingOccurrences(of: " ", with: "+")
                
                self.navigationController?.pushViewController(detailVC, animated: true)
               
            }.disposed(by: disposeBag)
           }
    
    func favoriMovieStatus(cell: FavouriteCollectionViewCell, model: FavouriteMovie) {
        let favoriteList = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
        if favoriteList.firstIndex(where: {$0.id == model.id}) != nil{
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    }
