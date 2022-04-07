//
//  CNTimelineCellStyle.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 31/3/2022.
//

import Foundation
import UIKit

/// A style configuration for CNTimelineCell
///
/// Used to setting the left and right ``CNTimelineCellStyle/LineStyle``,
///  ``CNTimelineCellStyle/BubbleStyle-swift.struct``  and color
///  of message separator in message dialog
///
///
public struct CNTimelineCellStyle {
  
  /// left line style
  public var leftLineStyle: LineStyle = LineStyle()
  
  /// right line style
  public var rightLineStyle: LineStyle = LineStyle()
  
  /// bubble style
  public var bubbleStyle: BubbleStyle = BubbleStyle()
  
  /// setting color of message separator
  public var messageSeparator: UIColor = .lightGray
  
  static let `default` = CNTimelineCellStyle()
  
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

public extension CNTimelineCellStyle {
  
  /// Line style can be configured by LineStyle struct.
  struct LineStyle {
    
    /// width of the central line
    public var lineWidth: CGFloat = 6
    
    /// diameter of circle spot
    public var spotDiameter: CGFloat = 20

    /// vertical offset of spot
    public var spotOffsetY: CGFloat = 29
    
    /// color of line
    public var lineColor: UIColor = .init(_colorLiteralRed: 0/255, green: 144/255, blue: 182/255, alpha: 1)
    
    /// color of central circle spot
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
}

public extension CNTimelineCellStyle {
  
  /// Set the dialog style using BubbleStyle struct
  struct BubbleStyle {

    /// vertical offset of arrow
    public var arrowOffsetY: CGFloat = 30
    
    /// width of border
    public var borderWidth: CGFloat = 2
    
    /// color of border
    public var borderColor: UIColor = .init(red: 0/255, green: 147/255, blue: 51/255, alpha: 1)
    
    /// button background color
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
}
