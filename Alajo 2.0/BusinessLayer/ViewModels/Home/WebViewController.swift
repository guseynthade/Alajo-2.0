//
//  WebViewController.swift
//  Alajo
//
//  Created by God's on 3/31/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView!
    
    private (set) var movie: MovieCellProtocol?
    
    func setMovie(_ movie: MovieCellProtocol?) {
        self.movie = movie
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        let url = URL(string: "https://www.youtube.com/results?search_query=\(movie?.nameTitle ?? "")")
        webView.load(URLRequest(url:url!))

    }
    

}
