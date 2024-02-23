//
//  DivinationViewController.swift
//  DivinationBYMemes
//
//  Created by Kate Kashko on 22.02.2024.
//



import UIKit

class DivinationViewController: UIViewController {
    
    var divinationText: String?

    private lazy var divinationStackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 100
        element.alignment = .center
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
   private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = divinationText
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "photo")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 80
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var likeButton: UIButton = {
        let element = UIButton()
        element.setTitle("👍🏻", for: .normal)
        element.titleLabel?.font = .systemFont(ofSize: 60)
        element.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var dislikeButton: UIButton = {
        let element = UIButton()
        element.setTitle("👎🏻", for: .normal)
        element.titleLabel?.font = .systemFont(ofSize: 60)
        element.addTarget(self, action: #selector(dislikeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }

    @objc func likeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dislikeButtonTapped() {
        print("dislike")
    }
}

extension DivinationViewController {
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(divinationStackView)
        
        divinationStackView.addArrangedSubview(questionLabel)
        divinationStackView.addArrangedSubview(image)
        divinationStackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(likeButton)
        buttonsStackView.addArrangedSubview(dislikeButton)
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            divinationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divinationStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            image.heightAnchor.constraint(equalToConstant: 250),
            
        ])
    }
}
