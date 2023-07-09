//
//  MovieListViewController.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import UIKit

class MovieListviewController: UIViewController {
    
    var movieListPresenter: ViewToPresenterMovieListProtocol?
    
    private let movieListTableView = UITableView()
    var movieList: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(movieListTableView)
        setupTableView()
        setupTableViewCell()
        setupView()
        movieListPresenter?.startFetchingMovieList()
    }
    
    private func setupTableView() {
        movieListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
    }
    
    private func setupTableViewCell() {
        movieListTableView.register(GenreCell.self, forCellReuseIdentifier: "genreCell")
    }
        
    private func setupView() {
        navigationItem.title = "Movie List"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}

extension MovieListviewController: PresenterToViewMovieListProtocol {
    
    func onMovieListFetchSuccess(movieList: Array<MovieModel>) {
        self.movieList = movieList
        movieListTableView.reloadData()
    }
    
    func onMovieListFetchFailed(error: String) {
        
    }
}

extension MovieListviewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreCell
        cell.setupLabel(title: movieList[indexPath.row].title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieListPresenter?.router?.goToMovieDetail(navigationController: self.navigationController, movieId: movieList[indexPath.row].id)
    }
}
