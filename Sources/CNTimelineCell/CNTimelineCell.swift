//
//  CNTimelineCell.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import UIKit

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
  
  func configureCell() {
    
  }
  
  public func setCellWithItem(_ item: TimelineItem) {
    timelineLeft.timelineType = item.leftType
    timelineLeft.isHidden = item.leftType == .none
    timelineRight.timelineType = item.rightType
    timelineRight.isHidden = item.rightType == .none
    if item.leftType == .start || item.leftType == .spot || item.leftType == .end {
      timelineBubbleView.hasLeftArrow = true
      timelineBubbleView.constraintWith(identifier: "leftMargin")?.constant = 16
    } else {
      timelineBubbleView.hasLeftArrow = false
      timelineBubbleView.constraintWith(identifier: "leftMargin")?.constant = 8
    }
    if item.rightType == .start || item.rightType == .spot || item.rightType == .end {
      timelineBubbleView.hasRightArrow = true
      timelineBubbleView.constraintWith(identifier: "rightMargin")?.constant = 16
    } else {
      timelineBubbleView.hasRightArrow = false
      timelineBubbleView.constraintWith(identifier: "rightMargin")?.constant = 8
    }
    
    title.text = item.title
    content.text = item.content
    icon.image = item.image
    icon.isHidden = item.image == nil
  }
  
  public func setCellStyle(_ timelineStyle: TimelineStyle) {
    if let myConstraint = timelineLeft.constraintWith(identifier: "timelineLeftWidth"){
      myConstraint.constant = timelineStyle.leftLineStyle.spotDiameter
    }
    timelineLeft.lineStyle = timelineStyle.leftLineStyle
    
    if let myConstraint = timelineRight.constraintWith(identifier: "timelineRightWidth"){
      myConstraint.constant = timelineStyle.rightLineStyle.spotDiameter
    }
    timelineRight.lineStyle = timelineStyle.rightLineStyle
    
    timelineBubbleView.bubbleStyle = timelineStyle.bubbleStyle
    messageSeparator.backgroundColor = timelineStyle.messageSeparator
  }
}
