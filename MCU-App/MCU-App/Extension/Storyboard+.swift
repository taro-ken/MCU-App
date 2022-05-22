//
//  Storyboard+.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/21.
//

import UIKit

extension UIStoryboard {
  static var mcuMovieViewController: MCUmovieViewController {
    UIStoryboard.init(name: "MCUmovie", bundle: nil).instantiateInitialViewController() as! MCUmovieViewController
  }

  static var mcuDramaViewController: MCUdramaViewController {
    UIStoryboard.init(name: "MCUdrama", bundle: nil).instantiateInitialViewController() as! MCUdramaViewController
  }
}
