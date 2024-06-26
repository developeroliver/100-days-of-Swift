//
//  StormViewController.swift
//  Storm Viewer
//
//  Created by olivier geiger on 26/04/2024.
//

import UIKit

class StormViewController: UITableViewController {
    
    // MARK: - Properties
    var pictures = [String]()
    let reuseID = "CELL_ID"

    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFileManager()
        setupTableView()
        layout()
    }
}

// MARK: - Helpers
extension StormViewController {
    
    private func setupFileManager() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.separatorColor = UIColor.blue.withAlphaComponent(0.1)
        self.tableView = tableView
    }
}

// MARK: - DataSource and Delegate
extension StormViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        cell.selectedBackgroundView = selectedView
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navigation = DetailViewController()
        navigation.selectedImageName = pictures[indexPath.row]
        
        navigationController?.pushViewController(navigation, animated: true)
    }
}
