//
//  MCUdramaViewController.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/21.
//

import UIKit
import RxSwift

final class MCUdramaViewController: UIViewController {
    
    private let mcuDramaCell = "MCUdramaCell"
    private let viewModel = MCUViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var dramaTableView: UITableView! {
        didSet {
            dramaTableView.register(UINib(nibName: mcuDramaCell, bundle: nil), forCellReuseIdentifier: mcuDramaCell)
            dramaTableView.allowsSelection = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.requestDramaData()
    }
    
    private func bind() {
        viewModel.models
            .bind(to: dramaTableView.rx.items(cellIdentifier: mcuDramaCell, cellType: MCUdramaCell.self)) { row, element, cell in
                cell.trailerButton.addTarget(nil, action: #selector(cell.tapTrailerButton(_:)), for: .touchUpInside)
                cell.trailerButton.tag = row
                cell.configure(model: element) }.disposed(by: disposeBag)
    }
}
