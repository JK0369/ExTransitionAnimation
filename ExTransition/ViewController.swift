//
//  VC1.swift
//  ExTransition
//
//  Created by Jake.K on 2022/03/20.
//

import UIKit

class ViewController: UIViewController {
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "VC1 화면"
    label.font = .systemFont(ofSize: 50)
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(label)
    return label
  }()
  private lazy var nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.nextButton)
    
    NSLayoutConstraint.activate([
      self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.nextButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
      self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func didTapNextButton() {
    let vc2 = VC2()
    vc2.transitioningDelegate = self
    vc2.modalPresentationStyle = .fullScreen
    self.present(vc2, animated: true)
  }
}

extension ViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    MyPresentTransition()
  }
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    nil
  }
}
