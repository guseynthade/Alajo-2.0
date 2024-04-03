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

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet private weak var segmentView: UISegmentedControl!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBAction func segmentAction(_ sender: Any) {
        setSegmentType()
    }
    

    var type: SegmentType = .Today
    var segmentCallBack: ((SegmentType) ->())?
    var moreCallBack: ((SegmentType) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentView.tintColor = UIColor(named: "text")
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
//        segmentView.makeTransparent()
//        segmentView.backgroundColor = UIColor.clear
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

extension UISegmentedControl {
    func makeTransparent() {
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        setBackgroundImage(UIImage(), for: [.highlighted, .selected], barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
}
