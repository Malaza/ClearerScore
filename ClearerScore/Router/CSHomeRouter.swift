//
//  CSHomeRouter.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/08.
//

import UIKit

class CSHomeRouter: NSObject, CSHomeRouterProtocol {
    
    //MARK: - Variables
    var view: (CSHomeViewProtocol & UIViewController)?
    
    
    static func start() -> CSHomeRouterProtocol {
        
        let router = CSHomeRouter()
        
        let presenter = CSHomePresenter()
        let view = CSHomeViewController()
        let interactor = CSHomeInteractor()
        let service = CSService()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.service = service
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.view = view
        return router
    }
    
    //MARK: - Navigation
    func presentDetailViewController(controller: UIViewController, model: CSUserScoreModel?) {
        let viewController = CSDetailViewController(userModel: model)
        controller.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentSearchViewController() {
        
    }
}
