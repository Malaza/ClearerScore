//
//  CSUserScoreModel.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/10.
//

import UIKit

class CSUserScoreModel: NSObject {
    var accountIDVStatus: String?
    var score: Int?
    var scoreBand: Int?
    var clientRef: String?
    var status: String?
    var maxScoreValue: Int?
    var hasEverDefaulted: Bool?
    var currentShortTermDebt: Int?
    var daysUntilNextReport: Int?
    var changeInShortTermDebt: Int?
    
    var scorePercentage: Float?
}
