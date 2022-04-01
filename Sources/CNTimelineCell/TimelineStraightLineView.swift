//
//  TimelineStraightLineView.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import Foundation
import UIKit

@IBDesignable
open class TimelineStraightLineView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    commonInit()
  }
  
  private func commonInit() {
    super.backgroundColor = .clear
  }
  
  @IBInspectable
  open var lineWidth: CGFloat = 12.0 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var spotOffsetY: CGFloat = 30.0 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var lineColor: UIColor = .clear {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var spotColor: UIColor = .blue {
    didSet {
      setNeedsDisplay()
    }
  }
  
  
  open var timelineType: TimelineType = .spot {
    didSet {
      setNeedsDisplay()
    }
  }
  
  open var lineStyle: LineStyle = LineStyle() {
    didSet {
      spotOffsetY = lineStyle.spotOffsetY
      lineColor = lineStyle.lineColor
      spotColor = lineStyle.spotColor
      lineWidth = lineStyle.lineWidth
      setNeedsDisplay()
    }
  }
  
  override open func draw(_ rect: CGRect) {
    guard timelineType != .none else { return }
    
    let spotRadius = rect.width / 2
    
    let top = timelineType == .start ? spotOffsetY : 0.0
    let bottom = timelineType == .end ? spotOffsetY : rect.height
    let width = rect.width
    
    let lineLeft = (width - lineWidth) / 2
    let lineRight = (width + lineWidth) / 2
    
    // draw line
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: lineLeft, y: top))
    bezierPath.addLine(to: CGPoint(x: lineRight, y: top))
    bezierPath.addLine(to: CGPoint(x: lineRight, y: bottom))
    bezierPath.addLine(to: CGPoint(x: lineLeft, y: bottom))
    bezierPath.addLine(to: CGPoint(x: lineLeft, y: top))
    bezierPath.close()
    lineColor.setFill()
    bezierPath.fill()
    
    guard timelineType != .line else { return }
    
    // draw outer spot
    let bezierPathOuterSpot = UIBezierPath()
    let spotCenterPoint = CGPoint(x: width / 2, y: spotOffsetY)
    bezierPathOuterSpot.move(to: spotCenterPoint)
    bezierPathOuterSpot.addArc(withCenter: spotCenterPoint, radius: spotRadius, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
    bezierPathOuterSpot.close()
    lineColor.setFill()
    bezierPathOuterSpot.fill()
    
    // draw inner spot
    let bezierPathInnerSpot = UIBezierPath()
    bezierPathInnerSpot.move(to: spotCenterPoint)
    bezierPathInnerSpot.addArc(withCenter: spotCenterPoint, radius: spotRadius / 2, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
    bezierPathInnerSpot.close()
    spotColor.setFill()
    bezierPathInnerSpot.fill()
  }
}
