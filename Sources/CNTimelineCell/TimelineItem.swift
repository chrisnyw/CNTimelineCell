//
//  TimelineItem.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 31/3/2022.
//

import Foundation
import UIKit

public struct TimelineItem {
  var title: String
  var content: String? = nil
  var image: UIImage? = nil
  var leftType: TimelineType = .none
  var rightType: TimelineType = .none
  
  public init(title: String,
              content: String? = nil,
              image: UIImage? = nil,
              leftType: TimelineType = .none,
              rightType: TimelineType = .none) {
    self.title = title
    self.content = content
    self.image = image
    self.leftType = leftType
    self.rightType = rightType
  }
}
