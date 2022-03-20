//
//  VC2.swift
//  ExTransition
//
//  Created by Jake.K on 2022/03/20.
//

import UIKit

final class VC2: UIViewController {
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "VC2 화면"
    label.font = .systemFont(ofSize: 50)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(label)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGray
    
    self.view.addSubview(self.titleLabel)
    NSLayoutConstraint.activate([
      self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
}
