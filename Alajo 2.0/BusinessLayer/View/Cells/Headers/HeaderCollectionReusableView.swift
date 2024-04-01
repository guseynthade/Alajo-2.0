//
//  HeaderCollectionReusableView.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

enum HeaderType: String {
    case today = "Today"
    case thisWeek = "This Week"
    case popular = "Popular"
    case topRated = "Top Rated"
}

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet private weak var titleMovie: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreAction(_ sender: UIButton) {
        moreCallBack?()
        print(#function)
    }
    
    var moreCallBack: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func confHeader(type: HeaderType) {
        titleMovie.text = type.rawValue
    }
    
}
