//
//  CSHomeViewController.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/08.
//

import UIKit

protocol CSHomeViewProtocol {
    func updateOnSuccess(with userScore: CSUserScoreModel)
    func updateOnFailure(with error: String)
}

class CSHomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var presenter: CSHomePresenterProtocol?
    var userScore: CSUserScoreModel?
    let refreshControl = UIRefreshControl()
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        self.refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        
        self.tableView.register(UINib(nibName: CSHomeTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: CSHomeTableViewCell.identifier)
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchUserScore()
    }
    
    
    //MARK: - Helper methods
    private func fetchUserScore() {
        self.showLoadingView()
        self.presenter?.fetchUserScore()
    }
    
    @objc private func refreshTableView() {
        self.presenter?.fetchUserScore()
    }
    
    private func showError(error: String?, completion:@escaping(UIAlertAction) -> Void) {
        let alert = UIAlertController(title: "User Score Failure",
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
}


extension CSHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CSHomeTableViewCell.identifier, for: indexPath) as? CSHomeTableViewCell {
            cell.configureWithUserModel(model: self.userScore, delegate: self)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.router?.presentDetailViewController(controller: self, model: self.userScore)
    }
}


extension CSHomeViewController: CSHomeViewProtocol {
    
    func updateOnSuccess(with userScore: CSUserScoreModel) {
        self.userScore = userScore
        
        if refreshControl.isRefreshing {
            self.refreshControl.endRefreshing()
        }
        self.hideLoadingView()
        self.tableView.reloadData()
    }
    
    func updateOnFailure(with error: String) {
        self.showError(error: error) { alert in
            self.hideLoadingView()
            self.fetchUserScore()
        }
    }
}


extension CSHomeViewController: CSHomeTableViewCellDelegate {
    
    func seeDetailedScore() {
        self.presenter?.router?.presentDetailViewController(controller: self, model: self.userScore)
    }
}
