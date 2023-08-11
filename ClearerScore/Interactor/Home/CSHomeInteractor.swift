//
//  CSHomeInteractor.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit

class CSHomeInteractor: CSHomeInteractorProtocol {
    
    var presenter: CSHomePresenterProtocol?
    var service: CSServiceProtocol?
    
    
    func fetchUserScore() {
        
        self.service?.executeFetchList(completion: { (data, error) in
            
            guard let data = data as? Data, error == nil else {
                self.presenter?.interactorDidFetchUserScore(with: .failure(CSServiceError.failed))
                print(CSServiceError.failed.localizedDescription)
                return
            }
            do {
                let userScore = try JSONDecoder().decode(CSUserResponse.self, from: data)
                self.presenter?.interactorDidFetchUserScore(with: .success(userScore))
                print(userScore)
            }
            catch {
                self.presenter?.interactorDidFetchUserScore(with: .failure(error))
                print(error.localizedDescription)
            }
        })
    }
}
