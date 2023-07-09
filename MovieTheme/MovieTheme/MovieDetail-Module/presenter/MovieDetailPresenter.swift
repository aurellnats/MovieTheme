//
//  MovieDetailPresenter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation

class MovieDetailPresenter: ViewToPresenterMovieDetailProtocol {
    
    var view: PresenterToViewMovieDetailProtocol?
    var interactor: PresenterToInteractorMovieDetailProtocol?
    var router: PresenterToRouterMovieDetailProtocol?
    var movieId: Int = 0
    
    func startFetchingMovieDetail() {
        interactor?.fetchMovieDetail(movieId: movieId)
    }
}

extension MovieDetailPresenter: InteractorToPresenterMovieDetailProtocol {
    
    func movieDetailFetchSuccess(movieData: MovieDetailModel) {
        view?.onMovieDetailFetchSuccess(movieData: movieData)
    }
    
    func movieDetailFetchFailed() {
        
    }
}
