//
//  CSHomeRouterProtocol.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/08.
//

import UIKit

protocol CSHomeRouterProtocol {
    
    var view: (CSHomeViewProtocol & UIViewController)? { get }
    
    static func start() -> CSHomeRouterProtocol
    
    
    func presentDetailViewController(controller: UIViewController, model: CSUserScoreModel?)
    func presentSearchViewController()
}
