//
//  MCUdramaCell.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/22.
//

import UIKit
import Kingfisher

final class MCUdramaCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var phase: UILabel!
    @IBOutlet weak var saga: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var state: MCUdoramaeCellState = DramaCellStateNotRegisteredAsFavorite()
    private let viewModel = MCUViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteButton.backgroundColor = .clear
        favoriteButton.tintColor = .gray
        trailerButton.addTarget(nil, action: #selector(tapTrailerButton), for: .touchUpInside)
        favoriteButton.addTarget(nil, action: #selector(tapFavoriteButton), for: .touchUpInside)
    }
    
    
    func configure(model: Data) {
        guard let image = model.coverUrl else {
            return
        }
        let url = URL(string: image)
        coverImage.kf.setImage(with: url)
        
        title.text = model.title
        releaseDate.text = model.releaseDate
        
        if model.phase == nil {
            phase.text = "coming soon"
        } else {
            phase.text = "フェーズ\(model.phase ?? 0 )"
        }
        if model.saga == nil {
            saga.text = "coming soon"
        } else {
            saga.text = model.saga
        }
    }
    
    @objc func tapTrailerButton(_ sender: UIButton) {
        let row = sender.tag
        viewModel.requestDramaTrailerData(row: row)
        print(row)
    }
    
    @objc func tapFavoriteButton() {
        state.tappedfavoriteButton(cell: self)
    }
    
    func setState(state: MCUdoramaeCellState) {
        self.state = state
    }
    
    func addFavorite() {
        favoriteButton.backgroundColor = .systemBlue
        favoriteButton.tintColor = .white
    }
    
    func removeFavorite() {
        favoriteButton.backgroundColor = .clear
        favoriteButton.tintColor = .gray
    }
}
