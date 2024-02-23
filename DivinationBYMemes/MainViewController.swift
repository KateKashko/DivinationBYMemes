//
//  ViewController.swift
//  DivinationBYMemes
//
//  Created by Kate Kashko on 22.02.2024.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 120
        element.alignment = .center
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainLabel: UILabel = {
        let element = UILabel()
        element.text = "Write you question"
        element.font = .systemFont(ofSize: 24, weight: .medium)
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let questionTF: UITextField = {
        let element = UITextField()
        element.borderStyle = .roundedRect
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let askButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .systemCyan
        element.setTitle("Ask", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        element.layer.cornerRadius = 10
        element.addTarget(self, action: #selector(askButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
   
    @objc func askButtonTapped() {
        
        let divinationVC = DivinationViewController()
        divinationVC.divinationText = questionTF.text
        let navigationController = UINavigationController(rootViewController: divinationVC)
        navigationController.modalPresentationStyle = .fullScreen
        //                navigationController.navigationBar.isHidden = true
        present(navigationController, animated: true, completion: nil)
        
    }
}

extension MainViewController {
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(questionTF)
        mainStackView.addArrangedSubview(askButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            questionTF.widthAnchor.constraint(equalToConstant: 250),
            
            askButton.widthAnchor.constraint(equalToConstant: 250),
            askButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

