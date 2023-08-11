//
//  CSHomeTableViewCell.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit
import ALProgressView

protocol CSHomeTableViewCellDelegate {
    func seeDetailedScore()
}

class CSHomeTableViewCell: UITableViewCell {

    static let identifier = "CSHomeTableViewCell"
    
    
    //MARK: - Outlets
    @IBOutlet weak var userTitleLabel: UILabel! {
        didSet {
            userTitleLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var scoreView: ALProgressRing! {
        didSet {
            scoreView.layer.borderColor = UIColor.red.cgColor
        }
    }

    @IBOutlet weak var yourScoreLabel: UILabel! {
        didSet {
            yourScoreLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.numberOfLines = 0
            scoreLabel.font = UIFont.systemFont(ofSize: 50)
        }
    }
    
    @IBOutlet weak var totalScoreLabel: UILabel! {
        didSet {
            totalScoreLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
    @IBOutlet weak var detailedScoreButton: UIButton! {
        didSet {
            detailedScoreButton.layer.borderColor = UIColor.progressBlueColor.cgColor
            detailedScoreButton.layer.borderWidth = 1.0
            detailedScoreButton.layer.cornerRadius = 30.0
        }
    }
    
    
    //MARK: - Variables
    var delegate: CSHomeTableViewCellDelegate?
    
    
    //MARK: - Lifecycle
    func configureWithUserModel(model: CSUserScoreModel?, delegate: CSHomeTableViewCellDelegate?) {
        
        if self.delegate == nil {
            self.delegate = delegate
        }
        self.userTitleLabel.text = "Welcome\n\(model?.clientRef ?? "")"
        self.scoreLabel.text = String(model?.score ?? 0)
        self.totalScoreLabel.text = "Out of \(model?.maxScoreValue ?? 0)"
        self.animateProgressRing(percentage: model?.scorePercentage ?? 0.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - Button actions
    @IBAction func seeDetailedScore(_ sender: Any) {
        self.delegate?.seeDetailedScore()
    }
    
    //MARK: - Helper methods
    private func animateProgressRing(percentage: Float) {
        self.scoreView.startColor = .progressGreenColor
        self.scoreView.endColor = .progressBlueColor
        self.scoreView.grooveColor = .progressGrooveColor
        self.scoreView.setProgress(percentage, animated: true)
    }
}

