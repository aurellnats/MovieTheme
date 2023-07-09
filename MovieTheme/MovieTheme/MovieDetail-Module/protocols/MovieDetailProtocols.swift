//
//  MovieDetailProtocols.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation

protocol PresenterToRouterMovieDetailProtocol {
    
    static func createMovieDetailModule(movieId: Int) -> MovieDetailViewController
}

protocol PresenterToViewMovieDetailProtocol {
    
    var movieDetailPresenter: ViewToPresenterMovieDetailProtocol? { get set }
    func onMovieDetailFetchSuccess(movieData: MovieDetailModel)
    func onMovieDetailFetchFailed(error: String)
}

protocol ViewToPresenterMovieDetailProtocol {
    
    var view: PresenterToViewMovieDetailProtocol? { get set }
    var interactor: PresenterToInteractorMovieDetailProtocol? { get set }
    var router: PresenterToRouterMovieDetailProtocol? { get set }
    var movieId: Int { get set }
    func startFetchingMovieDetail()
}

protocol PresenterToInteractorMovieDetailProtocol {
    
    var presenter: InteractorToPresenterMovieDetailProtocol? { get set }
    func fetchMovieDetail(movieId: Int)
}

protocol InteractorToPresenterMovieDetailProtocol {
    
    func movieDetailFetchSuccess(movieData: MovieDetailModel)
    func movieDetailFetchFailed()
}
