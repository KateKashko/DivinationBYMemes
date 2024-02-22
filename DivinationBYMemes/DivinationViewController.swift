//
//  DivinationViewController.swift
//  DivinationBYMemes
//
//  Created by Kate Kashko on 22.02.2024.
//



import UIKit

class DivinationViewController: UIViewController {
    
    var divinationText: String?
    private var stackButtonView = UIStackView()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        createQuestionLabel()
        createMemes()
        createLikeButton()
        createDislikeButton()
        createBackButton()
    }
    
    private func createQuestionLabel() {
        let label = UILabel()
        label.text = divinationText
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func createMemes() {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func createLikeButton() {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
    }
    
    private func createDislikeButton() {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    private func createBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension DivinationViewController {
    private func setViews() {
        view.backgroundColor = .white
    }
}

extension NSLayoutConstraint {
    static func setConstraints(for view: UIView, toSuperView superView: UIView, withInsets insets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superView.topAnchor, constant: insets.top),
            view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insets.left),
            view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -insets.right),
            view.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -insets.bottom)
        ])
    }
}
