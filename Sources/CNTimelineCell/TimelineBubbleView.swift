//
//  TimelineBubbleView.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import Foundation
import UIKit

@IBDesignable
open class TimelineBubbleView: UIView {
  
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
  
  private var bubbleColor: UIColor? {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var hasLeftArrow: Bool = false {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var hasRightArrow: Bool = false {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var arrowOffsetY: CGFloat = 30.0 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var borderWidth: CGFloat = 2 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable
  open var borderColor: UIColor = .clear {
    didSet {
      setNeedsDisplay()
    }
  }
  
  open var bubbleStyle: BubbleStyle = BubbleStyle() {
    didSet {
      arrowOffsetY = bubbleStyle.arrowOffsetY
      borderWidth = bubbleStyle.borderWidth
      borderColor = bubbleStyle.borderColor
      setNeedsDisplay()
    }
  }
  
  override open func draw(_ rect: CGRect) {
    let bezierPath = UIBezierPath()
    bezierPath.lineWidth = borderWidth
    
    let arrowDepth = 8.0
    let cornerRadius = 16.0
    
    let bottom = rect.height - borderWidth
    let right = rect.width - borderWidth
    let top = borderWidth
    let left = borderWidth
    let leftWithArrow = hasLeftArrow ? left + arrowDepth : left
    let rightWithArrow = hasRightArrow ? right - arrowDepth : right
    
    // bottom line from right to left
    bezierPath.move(to: CGPoint(x: rightWithArrow - cornerRadius, y: bottom))
    // bottom line
    bezierPath.addLine(to: CGPoint(x: leftWithArrow + cornerRadius, y: bottom))
    // bottom-left corner
    bezierPath.addQuadCurve(to: CGPoint(x: leftWithArrow, y: bottom - cornerRadius), controlPoint: CGPoint(x: leftWithArrow + borderWidth, y: bottom))
    // left arrow
    bezierPath.addLine(to: CGPoint(x: leftWithArrow, y: arrowOffsetY + borderWidth))
    bezierPath.addLine(to: CGPoint(x: left, y: arrowOffsetY - arrowDepth/2 + borderWidth))
    bezierPath.addLine(to: CGPoint(x: leftWithArrow, y: arrowOffsetY - arrowDepth + borderWidth))
    // left line
    bezierPath.addLine(to: CGPoint(x: leftWithArrow, y: cornerRadius + borderWidth))
    // top-left corner
    bezierPath.addQuadCurve(to: CGPoint(x: leftWithArrow + borderWidth + cornerRadius, y: top), controlPoint: CGPoint(x: leftWithArrow + borderWidth, y: top))
    // top line
    bezierPath.addLine(to: CGPoint(x: rightWithArrow - cornerRadius, y: top))
    // top-right corner
    bezierPath.addQuadCurve(to: CGPoint(x: rightWithArrow, y: top + cornerRadius), controlPoint: CGPoint(x: rightWithArrow - borderWidth, y: top))
    // right arrow
    bezierPath.addLine(to: CGPoint(x: rightWithArrow, y: arrowOffsetY - arrowDepth + borderWidth))
    bezierPath.addLine(to: CGPoint(x: right, y: arrowOffsetY - arrowDepth/2 + borderWidth))
    bezierPath.addLine(to: CGPoint(x: rightWithArrow, y: arrowOffsetY + borderWidth))
    // right line
    bezierPath.addLine(to: CGPoint(x: rightWithArrow, y: bottom - cornerRadius))
    // right-bottom corner
    bezierPath.addQuadCurve(to: CGPoint(x: rightWithArrow - cornerRadius, y: bottom), controlPoint: CGPoint(x: rightWithArrow, y: bottom))
    bezierPath.close()
    
    backgroundColor?.setFill()
    borderColor.setStroke()
    bezierPath.fill()
    bezierPath.stroke()
  }
}
