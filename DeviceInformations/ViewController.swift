//
//  ViewController.swift
//  DeviceInformations
//
//  Created by Александр Шушков on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var runButton: UIButton = {
        let button = UIButton()
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(runButtonPressed),
            for: .touchUpInside)
        return button
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addViews()
    }
    
    func addViews() {
        view.addSubview(runButton)
        view.addSubview(infoLabel)
        
        configureViews()
    }
    
    func configureViews() {
        NSLayoutConstraint.activate([
            runButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 32),
            runButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 32),
            runButton.heightAnchor.constraint(equalToConstant: 128),
            runButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -32),
            
            infoLabel.topAnchor.constraint(
                equalTo: runButton.bottomAnchor,
                constant: 32),
            infoLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 32),
            infoLabel.bottomAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -32),
            infoLabel.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -32)
        ])
    }
    
    @objc func runButtonPressed() {
        let version = UIDevice.current.systemVersion
        let model = UIDevice.modelName
        infoLabel.text = "iOS version: \(version)\nDevice model: \(model)"
    }
}

