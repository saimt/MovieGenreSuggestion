//
//  MovieItemTCell.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import UIKit
import SwiftUI
import SDWebImage

class MovieItemTCell: UITableViewCell {

    //MARK: - Controls
    private var imgPoster = Init(value: UIImageView()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private var vwContentStack = Init(value: UIStackView()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setupStandardVertical()
    }
    private var lblTitle = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.text = "Title"
    }
    private var lblSubTitle = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .left
        $0.text = "Subtitle"
    }
    private var lblDuration = Init(value: UILabel()){
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .left
        $0.text = "Duration"
    }
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureCell(movie: Movie) {
        lblTitle.text = movie.title
        lblSubTitle.text = movie.subtitle
        lblDuration.text = "\(movie.runtime) mins"
        imgPoster.sd_setImage(with: URL(string: movie.posterURL),
                              placeholderImage: UIImage(named: "placeholder"),
                              options: .continueInBackground)
    }
}

private extension MovieItemTCell {
    func setupUI() {
        contentView.addSubview(imgPoster)
        contentView.addSubview(vwContentStack)
        vwContentStack.addArrangedSubview(lblTitle)
        vwContentStack.addArrangedSubview(lblSubTitle)
        vwContentStack.addArrangedSubview(lblDuration)
        vwContentStack.setCustomSpacing(8, after: lblTitle)
        vwContentStack.setCustomSpacing(4, after: lblSubTitle)
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
    
    func setupConstraints() {
        imgPoster.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 8)
            .topAnchor(equalTo: contentView.topAnchor, constant: 8)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: 8)
            .widthAnchor(constant: 80)
        
        vwContentStack.centerVertical(equalTo: imgPoster.centerYAnchor)
            .leadingAnchor(equalTo: imgPoster.trailingAnchor, constant: 10)
        
        
    }
}


struct MovieItemCellPreview: PreviewProvider {
    static var previews: some View {
        CellPreviewContainer().frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
    }
    struct CellPreviewContainer: UIViewRepresentable {
        func makeUIView(context: UIViewRepresentableContext<MovieItemCellPreview.CellPreviewContainer>) -> UITableViewCell {
            return MovieItemTCell()
        }
        func updateUIView(_ uiView: UITableViewCell, context: UIViewRepresentableContext<MovieItemCellPreview.CellPreviewContainer>) {
        }
        typealias UIViewType = UITableViewCell
    }
}
