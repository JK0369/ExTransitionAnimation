//
//  MyDismissTransition.swift
//  ExTransition
//
//  Created by Jake.K on 2022/03/20.
//

import UIKit

final class MyDismissTransition: NSObject {

}

extension MyDismissTransition: UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    // 사라지는 뷰
    guard let fromView = transitionContext.view(forKey: .from) else { return }
    UIView.animate(
      withDuration: 0.5,
      animations: { fromView.alpha = 0 },
      completion: { completed in transitionContext.completeTransition(completed) }
    )
  }
}
