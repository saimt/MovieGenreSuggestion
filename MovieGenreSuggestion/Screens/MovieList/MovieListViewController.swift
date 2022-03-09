//
//  MovieListViewController.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import UIKit
import Combine

class MovieListViewController: UIViewController {
    
    //MARK: - Controls
    private var tableView = Init(value: UITableView()){
        $0.tableFooterView = UIView()
        $0.rowHeight = 110
    }
    private var lblNoResults = Init(value: UILabel()){
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "No search results"
        $0.textAlignment = .center
    }
    
    //MARK: - Variables
    private lazy var dataSource = makeDataSource()
    private var viewModel: MovieListViewModel!
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Name or genre"
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Lifecycle
    convenience init(_ viewModel: MovieListViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bindViewModel()
        viewModel.fetchMovies()
    }
    
    //MARK: - Methods
    private func bindViewModel() {
        viewModel.movieList.sink { [unowned self] movies in
            tableView.backgroundView = movies.count > 0 ? nil : lblNoResults
            updateList(movies: movies)
        }.store(in: &cancellables)
    }
    
    private func updateList(movies: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(movies, toSection: .movies)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

private extension MovieListViewController {
    func setupUI() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.register(MovieItemTCell.self, forCellReuseIdentifier: MovieItemTCell.name)
        tableView.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.title = "Movies"
    }
    
    func setupConstraints() {
        tableView.fitInSuperview()
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchMovie(searchString: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchMovie(searchString: "")
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.openDetails(of: movie)
    }
}

fileprivate extension MovieListViewController {
    enum Section: CaseIterable {
        case movies
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<Section, Movie> {
        return UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, movie in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieItemTCell.name) as? MovieItemTCell else {
                assertionFailure("Failed to dequeue \(MovieItemTCell.name)")
                return UITableViewCell()
            }
            cell.configureCell(movie: movie)
            return cell
        }
    }
}
