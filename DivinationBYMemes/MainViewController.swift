//
//  ViewController.swift
//  DivinationBYMemes
//
//  Created by Kate Kashko on 22.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        createLabel()
        createTextField()
        createButton()
    }
    
    private func createLabel() {
        let label = UILabel()
        label.text = "Write you question"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
    }
    
    private func createTextField() {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stackView.addArrangedSubview(textField)
    }
    
    private func createButton() {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemCyan
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(self, action: #selector(askButtonTapped), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 10
        stackView.addArrangedSubview(button)
        
    }
    
    @objc func askButtonTapped() {
        print("Button tapped")
    }
}

extension MainViewController {
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 80
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
