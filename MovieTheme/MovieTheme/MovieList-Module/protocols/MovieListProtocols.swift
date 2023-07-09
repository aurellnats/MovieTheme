//
//  MovieListProtocol.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import UIKit

protocol PresenterToRouterMovieListProtocol {
    static func createMovieListModule(genre: String) -> MovieListviewController
    func goToMovieDetail(navigationController: UINavigationController?, movieId: Int)
}

protocol PresenterToViewMovieListProtocol {
    
    var movieListPresenter: ViewToPresenterMovieListProtocol? { get set }
    func onMovieListFetchSuccess(movieList: Array<MovieModel>)
    func onMovieListFetchFailed(error: String)
}

protocol ViewToPresenterMovieListProtocol {
    
    var view: PresenterToViewMovieListProtocol? { get set }
    var interactor: PresenterToInteractorMovieListProtocol? { get set }
    var router: PresenterToRouterMovieListProtocol? { get set }
    var genreName: String { get set }
    func startFetchingMovieList()
}

protocol PresenterToInteractorMovieListProtocol {
    
    var presenter: InteractorToPresenterMovieListProtocol? { get set }
    func fetchMovieList(genre: String)
}

protocol InteractorToPresenterMovieListProtocol {
    
    func movieListFetchSuccess(movieList: Array<MovieModel>)
    func movieListFetchFailed()
}
