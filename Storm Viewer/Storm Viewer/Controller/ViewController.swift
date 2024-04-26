//
//  ViewController.swift
//  Storm Viewer
//
//  Created by olivier geiger on 26/04/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var pictures = [String]()

    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                print(pictures)
            }
        }
    }
}

