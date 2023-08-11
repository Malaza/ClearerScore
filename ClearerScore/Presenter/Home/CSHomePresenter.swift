//
//  CSHomePresenter.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/09.
//

import UIKit

class CSHomePresenter: CSHomePresenterProtocol {
    
    var router: CSHomeRouterProtocol?
    var view: CSHomeViewProtocol?
    var interactor: CSHomeInteractorProtocol?
    
    
    //MARK: - Input
    func fetchUserScore() {
        self.interactor?.fetchUserScore()
    }
    
    
    //MARK: - Output
    func interactorDidFetchUserScore(with result: Result<CSUserResponse, Error>) {
        
        switch result {
            case .success(let userScore):
            let model = self.transformToModel(response: userScore)
            self.view?.updateOnSuccess(with: model)
            case .failure(let error):
            self.view?.updateOnFailure(with: error.localizedDescription)
        }
    }
    
    
    //MARK: - Helper methods
    private func transformToModel(response: CSUserResponse?) -> CSUserScoreModel {
        let model = CSUserScoreModel()
        model.accountIDVStatus = response?.accountIDVStatus
        model.score = response?.creditReportInfo?.score
        model.scoreBand = response?.creditReportInfo?.scoreBand
        model.clientRef = response?.creditReportInfo?.clientRef
        model.status = response?.creditReportInfo?.status
        model.maxScoreValue = response?.creditReportInfo?.maxScoreValue
        model.hasEverDefaulted = response?.creditReportInfo?.hasEverDefaulted
        model.currentShortTermDebt = response?.creditReportInfo?.currentShortTermDebt
        model.daysUntilNextReport = response?.creditReportInfo?.daysUntilNextReport
        model.changeInShortTermDebt = response?.creditReportInfo?.changeInShortTermDebt
        
        model.scorePercentage = Float(response?.creditReportInfo?.score ?? 0) / Float(response?.creditReportInfo?.maxScoreValue ?? 0)
        
        return model
    }
}




var hasEverDefaulted: Bool?
var currentShortTermDebt: Int?
var daysUntilNextReport: Int?
var changeInShortTermDebt: Int?
