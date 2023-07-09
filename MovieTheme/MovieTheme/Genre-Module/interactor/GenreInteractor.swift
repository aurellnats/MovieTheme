//
//  GenreInteractor.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import Alamofire

class GenreInteractor: PresenterToInteractorGenreProtocol {
    
    var presenter: InteractorToPresenterGenreProtocol?
    
    func fetchGenre() {
        
        AF.request(MovieThemeService.getURL(param: .getGenre), headers: MovieThemeService.header).responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.data(withJSONObject: data) else { return }
                guard let result = try? JSONDecoder().decode(GenreListModel.self, from: json) else { return }
                self.presenter?.genreFetchSuccess(genreList: result.genres)
            case .failure(let error):
                print(error)
            }
        }
    }
}
