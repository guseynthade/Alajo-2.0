//
//  HomeViewController.swift
//  Alajo
//
//  Created by God's on 3/5/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var sortButton: UIButton!
    @IBOutlet private weak var mainCollection: UICollectionView!
    
    @IBAction func searchAction() {
        print(#function)
    }
    
    @IBAction func sortAction() {
        print(#function)
    }
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                viewModel.getPopularMovieList()
        setupView()
        
    }
    
    
    fileprivate func setupView() {
        confViewModel()
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        mainCollection.registerNib(with: "MovieCollectionViewCell")
    }
    
    fileprivate func confViewModel() {
        viewModel.successCallback = { [weak self] in
            guard let self = self else {return}
            print("success")
        }
        
        viewModel.errorCallback = { [weak self] errorString in
            guard let self = self else {return}
            print(errorString)
        }
    }
    
    fileprivate func showMoviewViewController() {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailController") as? MovieDetailController ?? MovieDetailController()
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
        print(#function)
    }
    
    fileprivate func moreAction(type: HeaderType) {
        
        print(type)
    }
    
    fileprivate func relodeCollectionView() {
        DispatchQueue.main.async {
            self.mainCollection.reloadData()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellClass: MovieCollectionViewCell.self, indexPath: indexPath)
        cell.setList(list: viewModel.getMovieList())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.getMovieList()[indexPath.row]
        viewModel.selectedMovie = movie
        showMoviewViewController()
        print(#function)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            reusableview.confHeader(type: viewModel.setHeader(index: indexPath.section))
            
            reusableview.moreCallBack = { [weak self] in
                guard let self = self else {return}
                let type = self.viewModel.setHeader(index: indexPath.section)
                self.moreAction(type: type)
            }
            return reusableview
            
        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            if indexPath.section == 0 {
//                return CGSize(width: 0, height: 24)
//            } else {
//                return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.43)
//            }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.43)
    }
    
}
