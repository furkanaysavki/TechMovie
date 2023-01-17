//
//  SearchViewController.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 31.12.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController, UIScrollViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    private var viewModel = SearchViewModel()
    private var disposeBag = DisposeBag()
    private var search = BehaviorRelay<String>(value: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        bindingSearchBar()
        bindingTableView()
        self.navigationController?.hidesBarsOnSwipe = true
    
       }
    
    private func registerCells(){
        
        searchTable.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
    }
}

extension SearchViewController {
    
    private func bindingSearchBar()  {
        searchBar
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .debug()
            .bind(to: search)
            .disposed(by: disposeBag)
    }
    
    func bindingTableView() {
        
        _ = search.subscribe { value in
            _ = value.map { query in
                
                self.viewModel.searchMovie(with: query.replacingOccurrences(of: " ", with: "+"))
            }
        }
        searchTable.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.Search.bind(to: searchTable.rx.items(cellIdentifier: "SearchTableViewCell", cellType: SearchTableViewCell.self)) {
            section, item, cell in
            
            cell.configure(with: item)
        }.disposed(by: disposeBag)
        searchTable.rx.modelSelected(Title.self)
            .subscribe { movie in
                
                let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                detailVC.id = movie.id
                detailVC.query = movie.original_name ?? (movie.original_title)!.replacingOccurrences(of: " ", with: "+")
                
                self.navigationController?.pushViewController(detailVC, animated: true)
                
            }.disposed(by: disposeBag)
    }
}


