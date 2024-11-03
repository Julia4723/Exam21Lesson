//
//  PanImageViewController.swift
//  Exam21Lesson
//
//  Created by user on 02.11.2024.
//

import UIKit

class PanImageViewController: UIViewController {
    
    
    //MARK: - Private Property
    private var image = UIImageView()
    
    private var dataManager: DataManageable?
    
    private var panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var topConstraint: NSLayoutConstraint!
    
    private var centerXConstraint: NSLayoutConstraint!
    
    
    //MARK: - Init
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupImage()
        setupLayout()
        setupGestureRecognizers()
        
    }
    
    //MARK: - Methods
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        
        switch gestureRecognizer.state {
        case .possible:
            break
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return}
            let gesturePoint = gestureRecognizer.location(in: view)
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .ended, .cancelled:
            panGestureAnchorPoint = nil
        
        case .failed, .recognized:
            break
        }
    }
}


extension PanImageViewController {
    
    private func setupImage() {
        view.addSubview(image)
        image.isUserInteractionEnabled = true
        image.image = .бараш
        image.backgroundColor = .clear
        image.layer.cornerRadius = Constants.imageCornerRadius
        image.clipsToBounds = true
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_ :)))
        image.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        let widthConstraint = image.widthAnchor.constraint(equalToConstant: Constants.initialImageDimSize )
        
        let heightConstraint = image.heightAnchor.constraint(equalToConstant: Constants.initialImageDimSize )
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            topConstraint,
            centerXConstraint
        ])
        
    }
}


private extension PanImageViewController {
    enum Constants {
        static let imageCornerRadius: CGFloat = 10.0
        static let initialImageDimSize: CGFloat = 150.0
    }
}
