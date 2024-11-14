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
        tableView.separatorStyle = .none
        tableView.backgroundColor = .background
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager?.getIsFavorite().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell()}
        
        let item = dataManager.getIsFavorite()[indexPath.row]
        
        cell.action = { myCell in
            if let index = tableView.indexPath(for: myCell) {
                let item = self.dataManager.getIsFavorite()[index.row]
                self.dataManager.toggleFavorite(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        cell.selectionStyle = .none
        cell.configure(item: item)
        
        return cell
    }
}

