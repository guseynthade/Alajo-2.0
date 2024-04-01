//
//  MovieDetailController.swift
//  Alajo
//
//  Created by God's on 3/31/24.
//

import UIKit

class MovieDetailController: UIViewController {
    
    @IBOutlet private weak var button: UIButton!
    
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle(viewModel.selectedMovie?.nameTitle, for: .normal)

    }

}
