//
//  CNTimelineCell.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import UIKit

/// A UITableViewCell library for generating TimelineCell
open class CNTimelineCell: UITableViewCell {
  public static let identifier = String(describing: CNTimelineCell.self)
  public static let bundle = Bundle.module
  
  @IBOutlet weak open var timelineLeft: TimelineStraightLineView!
  @IBOutlet weak open var timelineRight: TimelineStraightLineView!
  @IBOutlet weak open var timelineBubbleView: TimelineBubbleView!
  @IBOutlet weak open var title: UILabel!
  @IBOutlet weak open var content: UILabel!
  @IBOutlet weak open var icon: UIImageView!
  @IBOutlet weak open var messageSeparator: UIView!
  
  override open func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    configureCell()
  }
  
  override open func prepareForReuse() {
    super.prepareForReuse()
    title.text = nil
    content.text = nil
    icon.image = nil
  }
  
  /// helper function to setup the CNTimelineCell item and style
  public func setCell(item: CNTimelineCellItem, style: CNTimelineCellStyle? = nil) {
    setCellWithItem(item)
    setCellStyle(style ?? CNTimelineCellStyle.default)
  }
  
  // private funcations
  private func configureCell() {
    setCellStyle(CNTimelineCellStyle.default)
  }
  
  private func setCellWithItem(_ item: CNTimelineCellItem) {
    timelineLeft.timelineType = item.leftType
    timelineLeft.isHidden = item.leftType == .none
    timelineRight.timelineType = item.rightType
    timelineRight.isHidden = item.rightType == .none
    if item.leftType == .start || item.leftType == .spot || item.leftType == .end {
      timelineBubbleView.hasLeftArrow = true
    } else {
      timelineBubbleView.hasLeftArrow = false
    }
    if item.rightType == .start || item.rightType == .spot || item.rightType == .end {
      timelineBubbleView.hasRightArrow = true
    } else {
      timelineBubbleView.hasRightArrow = false
    }
    
    title.text = item.title
    content.text = item.content
    icon.image = item.image
    icon.isHidden = item.image == nil
  }
  
  private func setCellStyle(_ timelineStyle: CNTimelineCellStyle) {
    if let myConstraint = timelineLeft.constraintWith(identifier: "timelineLeftWidth"){
      myConstraint.constant = timelineStyle.leftLineStyle.spotDiameter
    }
    timelineLeft.lineStyle = timelineStyle.leftLineStyle
    
    if let myConstraint = timelineRight.constraintWith(identifier: "timelineRightWidth"){
      myConstraint.constant = timelineStyle.rightLineStyle.spotDiameter
    }
    timelineRight.lineStyle = timelineStyle.rightLineStyle
    
    timelineBubbleView.bubbleStyle = timelineStyle.bubbleStyle
    updateBubbleContentConstraint(timelineStyle.bubbleStyle.borderWidth)
    
    messageSeparator.backgroundColor = timelineStyle.messageSeparator
  }
  
  private func updateBubbleContentConstraint(_ borderWidth: CGFloat) {
    let margin = 6.0
    if let rightMargin = timelineBubbleView.constraintWith(identifier: "rightMargin") {
      let right = timelineBubbleView.hasRightArrow == true ? timelineBubbleView.arrowDepth : 0
      rightMargin.constant = margin + right + borderWidth
    }
    if let leftMargin = timelineBubbleView.constraintWith(identifier: "leftMargin") {
      let left = timelineBubbleView.hasLeftArrow == true ? timelineBubbleView.arrowDepth : 0
      leftMargin.constant = margin + left + borderWidth
    }
    if let topMargin = timelineBubbleView.constraintWith(identifier: "topMargin") {
      topMargin.constant = margin + borderWidth
    }
    if let bottomMargin = timelineBubbleView.constraintWith(identifier: "bottomMargin") {
      bottomMargin.constant = margin + borderWidth
    }
  }

}
