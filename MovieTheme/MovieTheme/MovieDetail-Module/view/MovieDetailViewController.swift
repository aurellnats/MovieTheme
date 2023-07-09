//
//  MovieViewController.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieDetailPresenter: ViewToPresenterMovieDetailProtocol?
    
    var stackView = UIStackView() 
    var movieTitleLabel = UILabel()
    var movieOverviewLabel = UILabel()
    var movieRatingLabel = UILabel()
    var moviePosterImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailPresenter?.startFetchingMovieDetail()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(24)
        }
    }
    
    private func setupDisplay(withData movieData: MovieDetailModel) {
        movieTitleLabel.text = movieData.title
        movieRatingLabel.text = String(describing: movieData.voteAverage)
        movieOverviewLabel.text = movieData.overview
        
//        view.addSubview(moviePosterImage)
        [self.movieTitleLabel, self.movieRatingLabel, self.movieOverviewLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        movieRatingLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        movieOverviewLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
}

extension MovieDetailViewController: PresenterToViewMovieDetailProtocol {
    
    func onMovieDetailFetchSuccess(movieData: MovieDetailModel) {
        setupDisplay(withData: movieData)
    }
    
    func onMovieDetailFetchFailed(error: String) {
        
    }
    
    
}
