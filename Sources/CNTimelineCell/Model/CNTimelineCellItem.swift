//
//  CNTimelineCellItem.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 31/3/2022.
//

import Foundation
import UIKit

/// Used item to setup the cell
public struct CNTimelineCellItem {
  
  /// title text displayesin dialog upper positon
  var title: String
  
  /// message content text displays in dialog lower positon
  var content: String? = nil
  
  /// icon image display in top-left corner insdie dialog
  var image: UIImage? = nil
  
  /// left ``TimelineType`` setup
  var leftType: TimelineType = .none
  
  /// right ``TimelineType`` setup
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
