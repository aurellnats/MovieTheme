//
//  MovieListInteractor.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import Alamofire

class MovieListInteractor: PresenterToInteractorMovieListProtocol {
    
    
    var presenter: InteractorToPresenterMovieListProtocol?
    
    func fetchMovieList(genre: String) {
        AF.request(MovieThemeService.getURL(param: .getMovieList(genre)), headers: MovieThemeService.header).responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.data(withJSONObject: data) else { return }
                guard let result = try? JSONDecoder().decode(MovieListModel.self, from: json) else { return }
                self.presenter?.movieListFetchSuccess(movieList: result.movieList)
            case .failure(let error):
                print(error)
            }
        }
    }
}


//curl --request GET \
//     --url 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=action' \
//     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMzhlYThjN2Y5OWZjYmI2MWEwOGFiOWE5NDNlNGJhNiIsInN1YiI6IjY0YTkyZjliNjZhMGQzMDEwMGQ4OTVmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hExpVQR8nD6tm827e-wsIYVnGoMwKH9f1djmDo8Xi5Q' \
//     --header 'accept: application/json'
