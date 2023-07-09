//
//  GenreRouter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import UIKit

class GenreRouter: PresenterToRouterGenreProtocol {
    
    static func createGenreModule() -> GenreViewController {
        let router = GenreRouter()
        
        var view = GenreViewController()
        var interactor: PresenterToInteractorGenreProtocol = GenreInteractor()
        var presenter: ViewToPresenterGenreProtocol & InteractorToPresenterGenreProtocol = GenrePresenter()
        
        view.genrePresenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        return view
    }
    
    func goToMovieList(navigationController: UINavigationController?, genre: String) {
        let movieListModule = MovieListRouter.createMovieListModule(genre: genre)
        navigationController?.pushViewController(movieListModule, animated: true)
    }
}
