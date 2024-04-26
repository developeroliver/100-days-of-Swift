//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by olivier geiger on 26/04/2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var selectedImageName: String?
    var fullImageView: UIImageView!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

// MARK: - @objc Functions

// MARK: - Helpers
extension DetailViewController {
    
    private func setup() {
        view.backgroundColor = .systemBackground
        title = selectedImageName
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func layout() {
        fullImageView = UIImageView(frame: view.bounds)
        fullImageView.contentMode = .scaleAspectFill
        fullImageView.clipsToBounds = true
        fullImageView.frame = view.bounds
        
        if let imageName = selectedImageName {
            fullImageView.image = UIImage(named: imageName)
        }
        
        view.addSubview(fullImageView)
    }
}
