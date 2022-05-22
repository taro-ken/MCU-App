//
//  HomeViewController.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/21.
//

import UIKit
import Parchment

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.red
        
        let mcuMovieVC = UIStoryboard.mcuMovieViewController
        let mcuDramaVC =  UIStoryboard.mcuDramaViewController
        
        mcuMovieVC.title = "映画"
        mcuDramaVC.title = "ドラマ"
        
        let pagingViewController = PagingViewController(viewControllers: [
            mcuMovieVC,
            mcuDramaVC
        ])
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pagingViewController.textColor = .black
        pagingViewController.selectedTextColor = .red
        pagingViewController.indicatorColor = .red
        
        pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pagingViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pagingViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}
