//
//  TimelineType.swift
//  CNTimelineCell
//
//  Created by Ying Wai Ng on 7/4/2022.
//

import Foundation

/// A type of a timeline style in cell.
///
/// ## Topics
///
/// ### TimelineType
///
/// - ``start``
/// - ``end``
/// - ``spot``
/// - ``line``
/// - ``none``
///
/// ### Defining Timeline style
///
/// - ``!=(_:_:)``
public enum TimelineType {
  /// Starting point of a line
  case start
  
  /// Ending point of a line
  case end
  
  /// A line with spot in middle
  case spot
  
  /// Only a line
  case line
  
  /// Nothing
  case none
}
