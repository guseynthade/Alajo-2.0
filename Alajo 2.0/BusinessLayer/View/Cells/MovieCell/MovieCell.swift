//
//  MovieCell.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

protocol MovieCellProtocol {
    var nameTitle: String {get}
    var dateTitle: String {get}
    var imgTitle: String {get}
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet private weak var movieImg: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        movieImg.layer.cornerRadius = 8
    }
    
    func confCell(model: MovieCellProtocol) {
        movieImg.loadURL(model.imgTitle)
        movieName.text = model.nameTitle
        movieDate.text = model.dateTitle
    }
}
