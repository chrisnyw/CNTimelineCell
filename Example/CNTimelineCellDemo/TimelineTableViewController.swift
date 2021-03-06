//
//  TimelineTableViewController.swift
//  CNTimelineCellDemo
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import UIKit
import CNTimelineCell

class TimelineTableViewController: UITableViewController {

  var timelineStyle: CNTimelineCellStyle = CNTimelineCellStyle()
  let dataItem: [CNTimelineCellItem] = [CNTimelineCellItem(title: "Good morning", content: "Today is sunny day!", image: UIImage(named: "light")),
                                        CNTimelineCellItem(title: "08:00 am", content: "Tom wakes up", image: UIImage(named: "star"), leftType: .start),
                                        CNTimelineCellItem(title: "08:05 am", content: "Breakfast time", leftType: .spot),
                                        CNTimelineCellItem(title: "08:30 am", content: "Mary wakes up", image: UIImage(named: "star"), leftType: .line, rightType: .start),
                                        CNTimelineCellItem(title: "09:00 am", content: "School time", image: UIImage(named: "school"), leftType: .spot, rightType: .spot),
                                        CNTimelineCellItem(title: "09:00 am - 12:00pm", content: "Many lessons\nMath\nEnglish\netc...", leftType: .line, rightType: .line),
                                        CNTimelineCellItem(title: "12:05 pm", content: "Lunch together", image: UIImage(named: "restaurant"), leftType: .spot, rightType: .spot),
                                        CNTimelineCellItem(title: "01:00 pm", content: "Outdoor activities, play games in sports court.", image: UIImage(named: "sports_basketball"), leftType: .spot, rightType: .spot),

                                        CNTimelineCellItem(title: "until 03:00 pm", content: "Afternoon lesson", leftType: .line, rightType: .line),
                                        CNTimelineCellItem(title: "03:00 pm", content: "Free time", leftType: .spot, rightType: .spot),
                                        CNTimelineCellItem(title: "03:30 pm", content: "Art lesson", leftType: .line, rightType: .spot),
                                        CNTimelineCellItem(title: "03:15 pm", content: "Take a nap", leftType: .end, rightType: .line),
                                        CNTimelineCellItem(title: "04:00 pm", content: "Play in playground", leftType: .none, rightType: .spot),
                                        CNTimelineCellItem(title: "04:15 pm", content: "Wake up from nap", leftType: .start, rightType: .line),
                                        CNTimelineCellItem(title: "05:00 pm", content: "Play TV games", leftType: .spot, rightType: .line),
                                        CNTimelineCellItem(title: "07:00 pm", content: "Dinner", image: UIImage(named: "restaurant"), leftType: .line, rightType: .spot),
                                        CNTimelineCellItem(title: "08:00 pm", content: "Dinner", image: UIImage(named: "restaurant"), leftType: .spot, rightType: .line),
                                        CNTimelineCellItem(title: "10:00 pm", content: "Goto sleep", image: UIImage(named: "bed"), leftType: .line, rightType: .end),
                                        CNTimelineCellItem(title: "10:30 pm", content: "Goto sleep", image: UIImage(named: "single_bed"), leftType: .end, rightType: .none),
                                        CNTimelineCellItem(title: "Awesome", content: "That's all for the day", image: UIImage(named: "auto_awesome")),]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let timelineTableViewCellNib = UINib(nibName: CNTimelineCell.identifier, bundle: CNTimelineCell.bundle)
    self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: CNTimelineCell.identifier)
    
    let timelineRight = CNTimelineCellStyle.LineStyle(lineColor: .red)
    timelineStyle = CNTimelineCellStyle(rightLineStyle: timelineRight)
  }

  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return dataItem.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CNTimelineCell.identifier, for: indexPath) as! CNTimelineCell
    
    let timelineItem = dataItem[indexPath.row]
    
////    // sample for change border color
    if indexPath.row == dataItem.count-1 || indexPath.row == 0 {
      timelineStyle.bubbleStyle.borderColor = .orange
    } else {
      timelineStyle.bubbleStyle.borderColor = .init(red: 0/255, green: 147/255, blue: 51/255, alpha: 1)
    }
//
////    // sample for change backgroundColor of bubbleView
    if indexPath.row == 3 {
      timelineStyle.bubbleStyle.backgroundColor = .lightGray
      timelineStyle.messageSeparator = .orange
    } else {
      timelineStyle.bubbleStyle.backgroundColor = .clear
      timelineStyle.messageSeparator = .lightGray
    }

    cell.setCell(item: timelineItem, style: timelineStyle)

    return cell
  }
  
}
