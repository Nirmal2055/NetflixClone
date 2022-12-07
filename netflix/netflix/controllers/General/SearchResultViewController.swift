//
//  SearchResultViewController.swift
//  netflix
//
//  Created by Nirmal Koirala on 11/07/2022.
//

import UIKit

protocol SearchResultViewControllerDelegate: AnyObject {
    
    func searchResultViewControllerDidTapItem(_ viewModel: TitleViewModel)
    
}

class SearchResultViewController: UIViewController {
    
    public weak var delegate: SearchResultViewControllerDelegate?
    
    
    public var titles: [Title] = [Title]()

    
    public let searchResultCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(searchResultCollectionView)
        
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }
    
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
             return UICollectionViewCell()
            
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return  cell
            
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        let title = titles[indexPath.row]
//        let titleName = title.original_title ?? ""
//
//        APICaller.shared.getMovie(with: titleName ) { [weak self] result in
//            switch result {
//            case .success(let videoElement):
//                self?.delegate?.searchResultViewControllerDidTapItem(TitlePreviewViewModel(title: title.original_title ?? "", youtubeView: videoElement, titleOverview: title.overview ?? ""))
//
//
//
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }

