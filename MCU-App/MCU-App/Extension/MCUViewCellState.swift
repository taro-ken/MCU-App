//
//  MCUViewCellState.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/22.
//

import UIKit


protocol MCUmovieCellState {
    func tappedfavoriteButton(cell: MCUmovieCell)
}

protocol MCUdoramaeCellState {
    func tappedfavoriteButton(cell: MCUdramaCell)
}

class MovieCellStateRegisteredAsFavorite: MCUmovieCellState {
    func tappedfavoriteButton(cell: MCUmovieCell) {
        cell.removeFavorite()
        cell.setState(state: MovieCellStateNotRegisteredAsFavorite() )
    }
}

class MovieCellStateNotRegisteredAsFavorite: MCUmovieCellState {
    func tappedfavoriteButton(cell: MCUmovieCell) {
        cell.addFavorite()
        cell.setState(state: MovieCellStateRegisteredAsFavorite() )
    }
}

class DramaCellStateRegisteredAsFavorite: MCUdoramaeCellState {
    func tappedfavoriteButton(cell: MCUdramaCell) {
        cell.removeFavorite()
        cell.setState(state: DramaCellStateNotRegisteredAsFavorite() )
    }
}

class DramaCellStateNotRegisteredAsFavorite: MCUdoramaeCellState {
    func tappedfavoriteButton(cell: MCUdramaCell) {
        cell.addFavorite()
        cell.setState(state: DramaCellStateRegisteredAsFavorite() )
    }
}
