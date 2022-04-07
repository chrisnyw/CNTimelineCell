//
//  TimelineUtils.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 31/3/2022.
//

import Foundation
import UIKit

extension UIView {
  func constraintWith(identifier: String) -> NSLayoutConstraint? {
    return self.constraints.first(where: {$0.identifier == identifier})
  }
}
