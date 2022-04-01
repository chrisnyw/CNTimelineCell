//
//  TimelineTableViewController.swift
//  CNTimelineCellDemo
//
//  Created by Ying Wai Ng on 30/3/2022.
//

import UIKit
import CNTimelineCell

class TimelineTableViewController: UITableViewController {

  var timelineStyle: TimelineStyle = TimelineStyle()
  let dataItem: [TimelineItem] = [TimelineItem(title: "Good morning", content: "Today is sunny day!", image: UIImage(systemName: "sun.min")),
                                  TimelineItem(title: "08:00 am", content: "Tom wakes up", image: UIImage(systemName: "star.fill"), leftType: .start),
                                  TimelineItem(title: "08:05 am", content: "Breakfast time", leftType: .spot),
                                  TimelineItem(title: "08:30 am", content: "Mary wakes up", image: UIImage(systemName: "star.fill"), leftType: .line, rightType: .start),
                                  TimelineItem(title: "09:00 am", content: "School time", image: UIImage(systemName: "studentdesk"), leftType: .spot, rightType: .spot),
                                  TimelineItem(title: "09:00 am - 12:00pm", content: "Many lessons\nMath\nEnglish\netc...", leftType: .line, rightType: .line),
                                  TimelineItem(title: "12:05 pm", content: "Lunch together", image: UIImage(systemName: "fork.knife"), leftType: .spot, rightType: .spot),
                                  TimelineItem(title: "01:00 pm", content: "Outdoor activities, play games in sports court.", image: UIImage(systemName: "sportscourt"), leftType: .spot, rightType: .spot),
                                  
                                  TimelineItem(title: "until 03:00 pm", content: "Afternoon lesson", leftType: .line, rightType: .line),
                                  TimelineItem(title: "03:00 pm", content: "Free time", leftType: .spot, rightType: .spot),
                                  TimelineItem(title: "03:30 pm", content: "Art lesson", leftType: .line, rightType: .spot),
                                  TimelineItem(title: "03:15 pm", content: "Take a snap", leftType: .end, rightType: .line),
                                  TimelineItem(title: "04:00 pm", content: "Play in playground", leftType: .none, rightType: .spot),
                                  TimelineItem(title: "04:15 pm", content: "Wake up from snap", leftType: .start, rightType: .line),
                                  TimelineItem(title: "05:00 pm", content: "Play TV games", leftType: .spot, rightType: .line),
                                  TimelineItem(title: "07:00 pm", content: "Dinner", image: UIImage(systemName: "fork.knife"), leftType: .line, rightType: .spot),
                                  TimelineItem(title: "08:00 pm", content: "Dinner", image: UIImage(systemName: "fork.knife"), leftType: .spot, rightType: .line),
                                  TimelineItem(title: "10:00 pm", content: "Goto sleep", image: UIImage(systemName: "bed.double"), leftType: .line, rightType: .end),
                                  TimelineItem(title: "10:30 pm", content: "Goto sleep", image: UIImage(systemName: "bed.double.fill"), leftType: .end, rightType: .none),
                                  TimelineItem(title: "Awesome", content: "That's all for the day", image: UIImage(systemName: "sparkles")),]
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let bundle = Bundle(for: CNTimelineCell.self)
    
    let timelineTableViewCellNib = UINib(nibName: CNTimelineCell.identifier, bundle: Bundle(for: CNTimelineCell.self))
    
    self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: CNTimelineCell.identifier)
    
    let timelineRight = LineStyle(lineColor: .red)
    timelineStyle = TimelineStyle(rightLineStyle: timelineRight)
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
    
    cell.setCellWithItem(timelineItem)
    
    if indexPath.row == dataItem.count-1 || indexPath.row == 0 {
      timelineStyle.bubbleStyle.borderColor = .orange
    } else {
      timelineStyle.bubbleStyle.borderColor = .init(red: 0/255, green: 147/255, blue: 51/255, alpha: 1)
    }
    cell.setCellStyle(timelineStyle)
    return cell
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
