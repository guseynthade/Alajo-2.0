//
//  MovieDetailController.swift
//  Alajo
//
//  Created by God's on 3/31/24.
//

import UIKit

class MovieDetailController: UIViewController {
    
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieData: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var favView: UIView!
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var trailerButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var favButton: UIButton!
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func trailerAction(_ sender: UIButton!) {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController ?? WebViewController()
        vc.setMovie(movie)
        navigationController?.pushViewController(vc, animated: true)
        print(#function)
    }
    private (set) var movie: MovieCellProtocol?
    
    func setMovie(_ movie: MovieCellProtocol?) {
        self.movie = movie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        movieImage.layer.cornerRadius = 16
        
        favView.layer.cornerRadius = 8
        
        backView.layer.cornerRadius = 8
        
        trailerButton.layer.cornerRadius = 8
        
        confMovie()
    }
    
    fileprivate func confMovie() {
        movieImage.loadURL(movie?.imgTitle ?? "")
        movieName.text = movie?.nameTitle
        movieData.text = movie?.dateTitle
        
    }
}
