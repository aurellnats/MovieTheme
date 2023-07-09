//
//  MovieListRouter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import UIKit

class MovieListRouter: PresenterToRouterMovieListProtocol {
    
    static func createMovieListModule(genre: String) -> MovieListviewController {
        
        let router = MovieListRouter()
        
        var view = MovieListviewController()
        var interactor: PresenterToInteractorMovieListProtocol = MovieListInteractor()
        var presenter: ViewToPresenterMovieListProtocol & InteractorToPresenterMovieListProtocol = MovieListPresenter()
        
        view.movieListPresenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        presenter.genreName = genre
        
        return view
    }
    
    func goToMovieDetail(navigationController: UINavigationController?, movieId: Int) {
        let movieDetailModule = MovieDetailRouter.createMovieDetailModule(movieId: movieId)
        navigationController?.pushViewController(movieDetailModule, animated: true)
    }
}
