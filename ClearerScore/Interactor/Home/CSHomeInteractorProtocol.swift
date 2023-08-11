//
//  CSHomeInteractorProtocol.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit

protocol CSHomeInteractorProtocol {
    
    var presenter: CSHomePresenterProtocol? { get set }
    var service: CSServiceProtocol? { get set }
    
    func fetchUserScore()
}
