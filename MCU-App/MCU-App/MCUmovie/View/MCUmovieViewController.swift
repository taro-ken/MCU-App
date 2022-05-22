//
//  ViewController.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/20.
//

import UIKit
import RxSwift


final class MCUmovieViewController: UIViewController {
    
    private let mcuMovieCell = "MCUmovieCell"
    private let viewModel = MCUViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet  weak var movieTableView: UITableView! {
        didSet {
            movieTableView.register(UINib(nibName: mcuMovieCell, bundle: nil), forCellReuseIdentifier: mcuMovieCell)
            movieTableView.allowsSelection = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.requestMovieData()
    }
    
    private func bind() {
        viewModel.models
            .bind(to: movieTableView.rx.items(cellIdentifier: mcuMovieCell, cellType: MCUmovieCell.self)) { row, element, cell in
                cell.trailerButton.addTarget(nil, action: #selector(cell.tapTrailerButton(_:)), for: .touchUpInside)
                cell.trailerButton.tag = row
                cell.configure(model: element) }.disposed(by: disposeBag)
    }
}
