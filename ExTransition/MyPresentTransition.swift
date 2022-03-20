//
//  MyPresentTransition.swift
//  ExTransition
//
//  Created by Jake.K on 2022/03/20.
//

import UIKit

final class MyPresentTransition: NSObject {
  
}

extension MyPresentTransition: UIViewControllerAnimatedTransitioning {
  private enum Constants {
    static let duration = 1.0
    static let affineTransform = CGAffineTransform(scaleX: 0.5, y: 0.5)
  }
  // 애니메이션 동작 시간
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    Constants.duration
  }
  
  // 커스텀 애니메이션 정의
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    // 1. 애니메이션에 적용할 뷰 획득
    let containerView = transitionContext.containerView
    guard let toView = transitionContext.view(forKey: .to) else { return }
    containerView.addSubview(toView)
    containerView.bringSubviewToFront(toView)
    
    // 2. 초기 위치 설정
    toView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      toView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      toView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      toView.topAnchor.constraint(equalTo: containerView.topAnchor),
    ])
    
    // 3. 커스텀 애니메이션 정의
    UIView.animateKeyframes(
      withDuration: Constants.duration,
      delay: 0,
      animations: {
        UIView.addKeyframe(
          withRelativeStartTime: 0 / 2,
          relativeDuration: 1 / 2,
          animations: {
            toView.transform = Constants.affineTransform
          }
        )
        UIView.addKeyframe(
          withRelativeStartTime: 1 / 2,
          relativeDuration: 1 / 2,
          animations: {
            toView.transform = .identity
          }
        )
      },
      completion: { transitionContext.completeTransition($0) }
    )
  }
}
