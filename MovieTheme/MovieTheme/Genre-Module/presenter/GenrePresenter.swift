//
//  GenrePresenter.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation

class GenrePresenter: ViewToPresenterGenreProtocol {
    
    var view: PresenterToViewGenreProtocol?
    var interactor: PresenterToInteractorGenreProtocol?
    var router: PresenterToRouterGenreProtocol?
    
    func startFetchingGenre() {
        interactor?.fetchGenre()
    }
}

extension GenrePresenter: InteractorToPresenterGenreProtocol {
    
    func genreFetchSuccess(genreList: Array<GenreModel>) {
        view?.onGenreResponseSuccess(genreModelList: genreList)
    }
    
    func genreFetchFailed() {
        
    }
}
