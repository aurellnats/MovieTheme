//
//  ViewController.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 07/07/23.
//

import Foundation
import UIKit
import SnapKit

class GenreViewController: UIViewController {
    
    var genrePresenter: ViewToPresenterGenreProtocol?
    
    private let genreTableView = UITableView()
    private var genres: [GenreModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(genreTableView)
        setupTableView()
        setupTableViewCell()
        setupView()
        genrePresenter?.startFetchingGenre()
    }

    private func setupTableView() {
        genreTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        genreTableView.delegate = self
        genreTableView.dataSource = self
    }
    
    private func setupTableViewCell() {
        genreTableView.register(GenreCell.self, forCellReuseIdentifier: "genreCell")
    }
    
    private func setupView() {
        navigationItem.title = "MovieTheme Genres"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}

extension GenreViewController: PresenterToViewGenreProtocol {
    
    func onGenreResponseSuccess(genreModelList: Array<GenreModel>) {
        genres = genreModelList
        genreTableView.reloadData()
    }
    
    func onGenreResponseFailed(error: String) {
        
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreTableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreCell
        cell.setupLabel(title: genres[indexPath.row].name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genrePresenter?.router?.goToMovieList(navigationController: self.navigationController, genre: genres[indexPath.row].name)
    }
}
