//
//  MovieInteractor.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation
import Alamofire

class MovieDetailInteractor: PresenterToInteractorMovieDetailProtocol {
    
    var presenter: InteractorToPresenterMovieDetailProtocol?
    
    func fetchMovieDetail(movieId: Int) {
        AF.request(MovieThemeService.getURL(param: .getMovieDetail(movieId)), headers: MovieThemeService.header).responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.data(withJSONObject: data) else { return }
                guard let result = try? JSONDecoder().decode(MovieDetailModel.self, from: json) else { return }
                self.presenter?.movieDetailFetchSuccess(movieData: result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
