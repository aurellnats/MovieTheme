//
//  GenreProtocols.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import UIKit

typealias EntryPoint = PresenterToViewGenreProtocol & UIViewController

protocol PresenterToRouterGenreProtocol {
    
    static func createGenreModule() -> GenreViewController
    func goToMovieList(navigationController: UINavigationController?, genre: String)
}

protocol PresenterToViewGenreProtocol {
    
    var genrePresenter: ViewToPresenterGenreProtocol? { get set }
    func onGenreResponseSuccess(genreModelList: Array<GenreModel>)
    func onGenreResponseFailed(error: String)
}

protocol ViewToPresenterGenreProtocol {
    
    var view: PresenterToViewGenreProtocol? { get set }
    var interactor: PresenterToInteractorGenreProtocol? { get set }
    var router: PresenterToRouterGenreProtocol? { get set }
    func startFetchingGenre()
}

protocol PresenterToInteractorGenreProtocol {
    
    var presenter: InteractorToPresenterGenreProtocol? { get set }
    func fetchGenre()
}

protocol InteractorToPresenterGenreProtocol {
    
    func genreFetchSuccess(genreList: Array<GenreModel>)
    func genreFetchFailed()
}
