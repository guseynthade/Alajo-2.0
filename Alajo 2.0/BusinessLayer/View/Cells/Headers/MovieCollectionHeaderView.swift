//
//  HeaderCollectionReusableView.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

enum SegmentType: String {
    case TopRated
    case ThisWeek
    case Popular
    case Today
}

class MovieCollectionHeaderView: UICollectionReusableView {
    
//    @IBAction func segmentAction(_ sender: Any) {
//        setSegmentType()
//    }
//    
//    @IBAction func moreAction(_ sender: Any) {
////        print(type)
//        
//    }
    @IBOutlet private weak var segmentView: UISegmentedControl!
    @IBOutlet private weak var titleLabel: UILabel!
//    @IBOutlet private weak var moreButton: UIButton!
    var type: SegmentType = .Today
    var segmentCallBack: ((SegmentType) ->())?
    var moreCallBack: ((SegmentType) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentView.tintColor = .black
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
    }
    
    func configureView() {
        titleLabel.text = "Trending"
        
        segmentView.setTitle(SegmentType.Today.rawValue,
            forSegmentAt: 0)
        segmentView.setTitle(SegmentType.ThisWeek.rawValue,
            forSegmentAt: 1)
        segmentView.setTitle(SegmentType.Popular.rawValue,
            forSegmentAt: 2)
        segmentView.setTitle(SegmentType.TopRated.rawValue,
            forSegmentAt: 3)
    }
    
    func setSegmentType() {
        switch segmentView.selectedSegmentIndex {
        case 0:
            segmentCallBack?(.Today)
        case 1:
            segmentCallBack?(.ThisWeek)
        case 2:
            segmentCallBack?(.Popular)
        case 3:
            segmentCallBack?(.TopRated)
        default: segmentCallBack?(.Today)
        }
    }
}
