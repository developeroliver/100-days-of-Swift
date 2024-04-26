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
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationController?.hidesBarsOnTap = true
        self.fullImageView.alpha = 0.0
        animateImageAppearance()
    }
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       navigationController?.hidesBarsOnTap = false
    }
}

// MARK: - @objc Functions
extension DetailViewController {
    
}

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
    
    private func animateImageAppearance() {
        UIView.animate(withDuration: 1.3) {
                self.fullImageView.alpha = 1.0
            }
        }
}
