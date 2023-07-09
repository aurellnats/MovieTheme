//
//  MovieListPresenter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation

class MovieListPresenter: ViewToPresenterMovieListProtocol {
    
    var view: PresenterToViewMovieListProtocol?
    var interactor: PresenterToInteractorMovieListProtocol?
    var router: PresenterToRouterMovieListProtocol?
    var genreName: String = ""
    
    func startFetchingMovieList() {
        interactor?.fetchMovieList(genre: genreName)
    }
}

extension MovieListPresenter: InteractorToPresenterMovieListProtocol {
    
    func movieListFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieListFetchSuccess(movieList: movieList)
    }
    
    func movieListFetchFailed() {
        
    }
    

}
