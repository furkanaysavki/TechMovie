//
//  ViewController.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 17.12.2022.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
import SDWebImage
import Gemini




class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
   
 
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var DiscoverCollectionView: GeminiCollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var trendingTvCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        bindingDiscoverMovies()
        bindingTrendingMovies()
        bindingTrendingTvs()
        bindingPopularMovies()
        bindingUpcomingMovies()
        bindingTopRatedMovies()
        configureAnimation()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        pageControl.currentPage = 0
        pageControl.numberOfPages = 10
    }
    private func registerCells(){
        DiscoverCollectionView.register(UINib(nibName: "DiscoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverCollectionViewCell")
        trendingCollectionView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        trendingTvCollectionView.register(UINib(nibName: "TrendingTvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingTvCollectionViewCell")
        popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        upcomingCollectionView.register(UINib(nibName: "UpcomingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
        topRatedCollectionView.register(UINib(nibName: "TopRatedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopRatedCollectionViewCell")
    }
    func configureAnimation() {
     
        DiscoverCollectionView.gemini
            .scaleAnimation()
            .scale(0.25)
            .scaleEffect(.scaleUp)
        }
}

extension HomeViewController {
    
    private func bindingDiscoverMovies() {
        self.viewModel.getDiscover()
        DiscoverCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.DiscoverMovies.bind(to: DiscoverCollectionView.rx.items(cellIdentifier: "DiscoverCollectionViewCell", cellType: DiscoverCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
            self.DiscoverCollectionView.animateCell(cell)
            
        }.disposed(by: disposeBag)
           
    }
    
    private func bindingTrendingMovies(){
        self.viewModel.getTrendingMovies()
        trendingCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.trendMovies.bind(to: trendingCollectionView.rx.items(cellIdentifier: "TrendingCollectionViewCell", cellType: TrendingCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
            
        }.disposed(by: disposeBag)
        }
    
    private func bindingTrendingTvs(){
        self.viewModel.getTrendingTvs()
        trendingTvCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.trendTvs.bind(to: trendingTvCollectionView.rx.items(cellIdentifier: "TrendingTvCollectionViewCell", cellType: TrendingTvCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
            
        }.disposed(by: disposeBag)
        
    }
    private func bindingPopularMovies(){
        self.viewModel.getPopularMovies()
        popularCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularMovies.bind(to: popularCollectionView.rx.items(cellIdentifier: "PopularCollectionViewCell", cellType: PopularCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
            
        }.disposed(by: disposeBag)
        
    }
    private func bindingUpcomingMovies(){
        self.viewModel.getUpcomingMovies()
        upcomingCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.upComingMovies.bind(to: upcomingCollectionView.rx.items(cellIdentifier: "UpcomingCollectionViewCell", cellType: UpcomingCollectionViewCell.self)) {
            section, item, cell in
           
            cell.configure(with: item)
            
        }.disposed(by: disposeBag)
        
    }
    private func bindingTopRatedMovies(){
        self.viewModel.getTopRatedMovies()
        topRatedCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.topRatedMovies.bind(to: topRatedCollectionView.rx.items(cellIdentifier: "TopRatedCollectionViewCell", cellType: TopRatedCollectionViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
            
        }.disposed(by: disposeBag)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.DiscoverCollectionView.animateVisibleCells()
        let visibleRect = CGRect(origin: self.DiscoverCollectionView.contentOffset, size: self.DiscoverCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.DiscoverCollectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
    
}
