//
//  MovieDetailRouter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation

class MovieDetailRouter: PresenterToRouterMovieDetailProtocol {
    
    static func createMovieDetailModule(movieId: Int) -> MovieDetailViewController {
        
        let router = MovieDetailRouter()
        
        let view = MovieDetailViewController()
        var interactor: PresenterToInteractorMovieDetailProtocol = MovieDetailInteractor()
        var presenter: ViewToPresenterMovieDetailProtocol & InteractorToPresenterMovieDetailProtocol = MovieDetailPresenter()
        
        view.movieDetailPresenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        presenter.movieId = movieId
        
        return view
    }
}
