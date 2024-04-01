//
//  MovieCollectionViewCell.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var movieCollection: UICollectionView!
    
    private var movieList: [MovieCellProtocol] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()

    }
    
    func setList(list: [MovieCellProtocol]) {
        movieList = list
        movieCollection.reloadData()
    }
    
    fileprivate func setupView() {
        movieCollection.dataSource = self
        movieCollection.delegate = self
        

        movieCollection.registerNib(with: "MovieCell")
    }

}

extension MovieCollectionViewCell: UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        let model = movieList[indexPath.row]
        cell.confCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width * 0.416, height: collectionView.frame.height)
    }
    
    
}
