//
//  ImageListViewController.swift
//  Exam21Lesson
//
//  Created by user on 07.11.2024.
//


import UIKit

class ImageListViewController: UIViewController {
    
    //MARK: - Private Methods
    
    private var dataManager: DataManageable?
    
    private let tableView = UITableView()
    private let cellIdentifier = "cell"
    
    //MARK: - Init
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

//MARK: - UITableViewDataSource

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager?.getAllElements().count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let element = dataManager?.getAllElements()[indexPath.row]
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = element?.imageName
        configuration.secondaryText = element?.description
       
        
        //configuration.image = UIImage(named: element?.imageName ?? "")
        
//        if let imageName = UIImage(named: element?.imageName ?? "") {
//            configuration.image = UIImage(named: element?.imageName ?? "")
//        } else {
//            configuration.image = UIImage(named: "placeholder")
//        }
//        
       
        cell.contentConfiguration = configuration
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            self.dataManager?.removeElements(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        
        let markAction = UIContextualAction(style: .normal, title: "Mark") { action, _, completion in
            
            self.dataManager?.checkedCell(index: indexPath.row)
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if let item = self.dataManager?.getAllElements()[indexPath.row].isMark {
                cell?.accessoryType = item ? .checkmark : .none
            }
            
            tableView.reloadRows(at: [indexPath], with: .middle)
            
            completion(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, markAction])
        
        return configuration
    }
}


//MARK: - Setup view

private extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}


//MARK: - Layout

private extension ImageListViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
