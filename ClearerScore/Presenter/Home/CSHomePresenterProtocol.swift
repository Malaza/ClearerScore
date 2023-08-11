//
//  CSHomePresenterProtocol.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit

protocol CSHomePresenterProtocol {
    
    var router: CSHomeRouterProtocol? { get set }
    var view: CSHomeViewProtocol? { get set }
    var interactor: CSHomeInteractorProtocol? { get set }
    
    
    //MARK: Input
    func fetchUserScore()
    
    
    //MARK: - Output
    func interactorDidFetchUserScore(with result: Result<CSUserResponse, Error>)
}
