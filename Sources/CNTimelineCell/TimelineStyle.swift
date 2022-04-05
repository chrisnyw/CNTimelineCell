//
//  TimelineStyle.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 31/3/2022.
//

import Foundation
import UIKit

public struct TimelineStyle {
  public var leftLineStyle: LineStyle = LineStyle()
  public var rightLineStyle: LineStyle = LineStyle()
  public var bubbleStyle: BubbleStyle = BubbleStyle()
  public var messageSeparator: UIColor = .lightGray
  
  static let `default` = TimelineStyle()
  
  public init(leftLineStyle: LineStyle = LineStyle(),
              rightLineStyle: LineStyle = LineStyle(),
              bubbleStyle: BubbleStyle = BubbleStyle(),
              messageSeparator: UIColor = .lightGray) {
    self.leftLineStyle = leftLineStyle
    self.rightLineStyle = rightLineStyle
    self.bubbleStyle = bubbleStyle
    self.messageSeparator = messageSeparator
  }
}

public struct LineStyle {
  public var lineWidth: CGFloat = 6
  public var spotDiameter: CGFloat = 20
  public var spotOffsetY: CGFloat = 29
  public var lineColor: UIColor = .init(_colorLiteralRed: 0/255, green: 144/255, blue: 182/255, alpha: 1)
  public var spotColor: UIColor = .white
  
  public init(lineWidth: CGFloat = 6,
              spotDiameter: CGFloat = 20,
              spotOffsetY: CGFloat = 29,
              lineColor: UIColor = .init(_colorLiteralRed: 0/255, green: 144/255, blue: 182/255, alpha: 1),
              spotColor: UIColor = .white) {
    self.lineWidth = lineWidth
    self.spotDiameter = spotDiameter
    self.spotOffsetY = spotOffsetY
    self.lineColor = lineColor
    self.spotColor = spotColor
  }
}

public struct BubbleStyle {
  public var arrowOffsetY: CGFloat = 30
  public var borderWidth: CGFloat = 2
  public var borderColor: UIColor = .init(red: 0/255, green: 147/255, blue: 51/255, alpha: 1)
  public var backgroundColor: UIColor = .clear
  
  public init(arrowOffsetY: CGFloat = 30,
              borderWidth: CGFloat = 2,
              borderColor: UIColor = .init(red: 0/255, green: 147/255, blue: 51/255, alpha: 1),
              backgroundColor: UIColor = .clear) {
    self.arrowOffsetY = arrowOffsetY
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.backgroundColor = backgroundColor
  }
}
