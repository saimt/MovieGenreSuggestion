//
//  MovieDetailViewController.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {

    //MARK: - Controls
    private var imgPoster = Init(value: UIImageView()){
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "placeholder")
        $0.backgroundColor = .black.withAlphaComponent(0.3)
    }
    private var vwContentStack = Init(value: UIStackView()){
        $0.setupStandardVertical()
    }
    private var lblTitle = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
    }
    private var lblSubtitle = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
    }
    private var lblActors = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    private var lblPlot = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    //MARK: - Variables
    var viewModel: MovieDetailViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Lifecycle
    convenience init(_ viewModel: MovieDetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    //MARK: - Methods
    private func setData(movie: Movie) {
        lblPlot.text = "Plot: \(movie.plot)"
        lblActors.text = "Cast: \(movie.actors)"
        lblTitle.text = movie.title
        lblSubtitle.text = movie.subtitle
        imgPoster.sd_setImage(with: URL(string: movie.posterURL),
                              placeholderImage: UIImage(named: "placeholder"),
                              options: .continueInBackground)
    }
    
    @objc func btnDownloadTapped(_ sender: UIBarButtonItem) {
        viewModel.downloadMovie { response in
            /// do whatever you want to do with downloaded file
            /// show alert, etc
            print(response)
        }
    }
}

private extension MovieDetailViewController {
    func setupUI() {
        view.addSubview(imgPoster)
        view.addSubview(vwContentStack)
        vwContentStack.addArrangedSubview(lblTitle)
        vwContentStack.addArrangedSubview(lblSubtitle)
        vwContentStack.addArrangedSubview(lblActors)
        vwContentStack.addArrangedSubview(lblPlot)
        vwContentStack.spacing = 5
        view.backgroundColor = .white
        
        let btnDownload = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_download"), style: .plain, target: self, action: #selector(btnDownloadTapped(_:)))
        navigationItem.rightBarButtonItem = btnDownload
        
        setData(movie: viewModel.movie)
    }
    
    func setupConstraints() {
        imgPoster.topAnchor(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .bottomAnchor(equalTo: view.centerYAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
        
        vwContentStack.topAnchor(equalTo: imgPoster.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: 10)
    }
}
