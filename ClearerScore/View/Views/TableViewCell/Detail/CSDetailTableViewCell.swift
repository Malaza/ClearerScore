//
//  CSDetailTableViewCell.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit

class CSDetailTableViewCell: UITableViewCell {

    static let identifier = "CSDetailTableViewCell"
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
        }
    }
    
    
    //MARK: - Lifecycle
    func configureWithTitle(title: String, content: String) {
        self.titleLabel.attributedText = self.attributedStringForTitle(title: title, content: content)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - Helper methods
    private func attributedStringForTitle(title:String, content:String) -> NSAttributedString {
        
        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.paragraphSpacing = 6.0
        
        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: range)
        mainAttributedString.append(attrHeading)
        
        let stringFormat = String(format: "\n\(content)")
        attrContent = NSMutableAttributedString(string: stringFormat)
        let thisRange = NSRange.init(location: 0, length: stringFormat.count)
        attrContent.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: thisRange)
        attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: thisRange)
        mainAttributedString.append(attrContent)
        
        mainAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                          range: NSRange.init(location: 0, length: mainAttributedString.length))
        
        return mainAttributedString
    }
}
