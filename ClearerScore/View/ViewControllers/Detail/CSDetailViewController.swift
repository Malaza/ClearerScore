//
//  CSDetailViewController.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/11.
//

import UIKit

class CSDetailViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var userScore: CSUserScoreModel?
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: CSDetailTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: CSDetailTableViewCell.identifier)
    }
    
    
    //MARK: - Lifecycle
    convenience init(userModel: CSUserScoreModel?) {
        self.init()
        self.userScore = userModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.title = userScore?.clientRef ?? ""
    }

}


extension CSDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Client Reference", content: self.userScore?.clientRef ?? "")
                return cell
            }
        }
        else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Score", content: String(self.userScore?.score ?? 0))
                return cell
            }
        }
        else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Max score value", content: String(self.userScore?.maxScoreValue ?? 0))
                return cell
            }
        }
        else if indexPath.row == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Status", content: self.userScore?.status ?? "")
                return cell
            }
        }
        else if indexPath.row == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Account IDV status", content: self.userScore?.accountIDVStatus ?? "")
                return cell
            }
        }
        else if indexPath.row == 5 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                let hasEverDefaulted = self.userScore?.hasEverDefaulted == true ? "Yes" : "No"
                cell.configureWithTitle(title: "Has ever defaulted", content:  hasEverDefaulted)
                return cell
            }
        }
        else if indexPath.row == 6 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Current short term debt", content: "R\(self.userScore?.currentShortTermDebt ?? 0)")
                return cell
            }
        }
        else if indexPath.row == 7 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CSDetailTableViewCell.identifier, for: indexPath) as? CSDetailTableViewCell {
                cell.configureWithTitle(title: "Days until next report", content: String(self.userScore?.daysUntilNextReport ?? 0))
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
