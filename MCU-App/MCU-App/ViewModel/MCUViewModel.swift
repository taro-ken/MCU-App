//
//  MCUViewModel.swift
//  MCU-App
//
//  Created by 木元健太郎 on 2022/05/21.
//

import Foundation
import Moya
import RxCocoa
import RxMoya
import RxSwift

final class MCUViewModel {
    
    var models = BehaviorRelay<[Data]>(value: [])
    var responseModel:[Data] = []
    private var disposeBag = DisposeBag()
    let provider = MoyaProvider<MCUAPI>()
    
    func requestMovieData() {
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { (response) in
                let responseData = response.data
                self.models.accept(responseData)
                print(responseData)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    func requestDramaData() {
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { (response) in
                let responseData = response.data
                self.models.accept(responseData)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    func requestMovieTrailerData(row: Int) {
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [self] (response) in
                self.responseModel = response.data
                guard let url = responseModel[row].trailerUrl,
                      let _url = URL(string: url) else {
                    return
                }
                UIApplication.shared.open(_url, options: [:], completionHandler: nil)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    func requestDramaTrailerData(row: Int) {
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [self] (response) in
                self.responseModel = response.data
                guard let url = responseModel[row].trailerUrl,
                      let _url = URL(string: url) else {
                    return
                }
                UIApplication.shared.open(_url, options: [:], completionHandler: nil)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
