//
//  MarkTableViewController.swift
//  Exam21Lesson
//
//  Created by user on 09.11.2024.
//

import UIKit

class MarkTableViewController: UITableViewController {
    //MARK: - Private Methods
    
    private var dataManager: DataManageable!
    private let cellIdentifier = "cell"
    
    
    //MARK: - Init
    
    init(dataManager: DataManageable) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tableView.separatorColor = .clear

    }
  
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager?.getIsFavorite().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell()}
        
        if let item = dataManager?.getIsFavorite()[indexPath.row] {
            cell.configure(item: item)
            cell.actionButton = {
                self.dataManager.toggleFavorite(item)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
