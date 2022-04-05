# CNTimelineCell

---

CNTimelineCell is a helpful framework to generate a timeline with UITableView.

Sample screenshot:
![withStyles][withStyles]

---
### Requirements
- iOS 10+
- Swift 5.3+
---
### Installation

#### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding CNTimelineCell as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/chrisnyw/CNTimelineCell", from: "0.1")
]
```
---
### How to use
#### - Import CNTimelineCell
Import `CNTimelineCell` when you need.
```swift
import CNTimelineCell
```

Prepare your `[TimelineItem]`, for examples:
```swift
  let dataItem: [TimelineItem] = [TimelineItem(title: "Sample", content: "Sample for LeftTimeline\nlineType = .none", leftType: .none),
                                  TimelineItem(title: "Start", content: "lineType = .start", image: UIImage(systemName: "star.fill"), leftType: .start),
                                  TimelineItem(title: "Spot", content: "lineType = .spot", leftType: .spot),
                                  TimelineItem(title: "Line", content: "lineType = .line", image: UIImage(systemName: "cloud.fill"), leftType: .line),
                                  TimelineItem(title: "End", content: "lineType = .end", image: UIImage(systemName: "moon.fill"), leftType: .end),]
```

Register TableViewCell as below:
```swift
    let timelineTableViewCellNib = UINib(nibName: CNTimelineCell.identifier, bundle: CNTimelineCell.bundle)
    self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: CNTimelineCell.identifier)
```

Render your cell:
```swift
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CNTimelineCell.identifier, for: indexPath) as! CNTimelineCell
    
    let timelineItem = dataItem[indexPath.row]
    cell.setCell(item: timelineItem)
    // or set pass your custom TimelineStyle:
    // cell.setCell(item: timelineItem, style: timelineStyle)
    return cell
  }
```

With the configuration above, you will have the result like this:
![sampleBasic][sampleBasic]

---
### Configuration

#### TimelineItem
`var title: String` message title
`var content: String?` message content
`var image: UIImage?` image icon
`var leftType: TimelineType` left TimelineType (default: `.none`)
`var rightType: TimelineType` right TimelineType (default: `.none`)

###### Sample TimelineItem:
```swift
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
                                  TimelineItem(title: "03:15 pm", content: "Take a nap", leftType: .end, rightType: .line),
                                  TimelineItem(title: "04:00 pm", content: "Play in playground", leftType: .none, rightType: .spot),
                                  TimelineItem(title: "04:15 pm", content: "Wake up from nap", leftType: .start, rightType: .line),
                                  TimelineItem(title: "05:00 pm", content: "Play TV games", leftType: .spot, rightType: .line),
                                  TimelineItem(title: "07:00 pm", content: "Dinner", image: UIImage(systemName: "fork.knife"), leftType: .line, rightType: .spot),
                                  TimelineItem(title: "08:00 pm", content: "Dinner", image: UIImage(systemName: "fork.knife"), leftType: .spot, rightType: .line),
                                  TimelineItem(title: "10:00 pm", content: "Goto sleep", image: UIImage(systemName: "bed.double"), leftType: .line, rightType: .end),
                                  TimelineItem(title: "10:30 pm", content: "Goto sleep", image: UIImage(systemName: "bed.double.fill"), leftType: .end, rightType: .none),
                                  TimelineItem(title: "Awesome", content: "That's all for the day", image: UIImage(systemName: "sparkles")),]
```

######Update style and item in cellForRowAtIndexPath
```swift
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
```

######Output:
![SampleOutput][withStyles]

#### Styling
##### LineType
There are five line types in TimelineType: `start`, `end`, `spot`, `line` and `none` 

| LineType                   | .start | .spot | .line | .end | .none |
|----------------------------|:--------:|:-------:|:-------:|:-------:|:-------:|
| LineType style | ![][lineTypeStart] | ![][lineTypeSpot] | ![][lineTypeLine] | ![][lineTypeEnd] | ![][lineTypeNone] |

##### LineStyle
Line style can be configured by LineStyle struct. 

`var lineWidth: CGFloat` width of the central line (default: `6.0`)
`var spotDiameter: CGFloat` diameter of circle spot (default: `20.0`)
`var spotColor: UIColor` color of central circle spot (default `.white`)
`var lineColor: UIColor` color of line (default `RGB(0, 144, 182)`)
`var spotOffsetY: CGFloat` vertical offset of spot (default: `29.0`)

| LineStyle                  | default | lineWidth = 10 | spotDiameter = 12 | spotColor = .orange | lineColor = .magenta | .spotOffsetY = 50 |
|----------------------------|:--------:|:-------:|:-------:|:-------:|:-------:|:-------:|
| Output | ![][lineTypeStart] | ![][lineStyleLineWidth] | ![][lineStyleSpotDiameter] | ![][lineStyleSpotColor] | ![][lineStyleLineColor] | ![][lineStyleOffsetY] |

##### BubbleStyle
Set the dialog style using BubbleStyle object
`var arrowOffsetY: CGFloat` vertical offset of arrow (default: `30.0`)
`var borderWidth: CGFloat` width of border (default: `2.0`)
`var borderColor: UIColor` color of border (default: `RBC(0, 147, 51)`)
`public var backgroundColor: UIColor` button background color (default `.clear`)

| BubbleStyle                  | Output |
|----------------------------|:--------:|
| default | ![][bubbleStyleDefault] |
| borderWidth = 8.0 | ![][bubbleStyleWidth] |
| borderColor = .orange | ![][bubbleStyleBorderColor] |
| backgroundColor = .systemGray6 | ![][bubbleStyleBackgroundColor] |
| arrowOffsetY = 50.0 | ![][bubbleStyleArrowOffsetY] |

##### TimelineStyle
Pass the LineStyle and BubbleStyle to TimelineStyle object to configure CNTimelineCell

`var leftLineStyle: LineStyle` left Timeline style (default: `LineStyle()`)
`var rightLineStyle: LineStyle` right Timeline style (default: `LineStyle()`)
`var bubbleStyle: BubbleStyle` bubble message style (default: `BubbleStyle()`)
`var messageSeparator: UIColor` color of separator line in message (default: `.lightGray`)


---
### Author
Chris Ng (chrisnyw@gmail.com)

---
### License
CNTimelineCell is available under the MIT license. See the LICENSE file for more info.


[withStyles]: Assets/withStyles.png
[sampleBasic]: Assets/sampleBasic.png

[lineTypeStart]: Assets/lineStart.png
[lineTypeSpot]: Assets/lineSpot.png
[lineTypeLine]: Assets/lineLine.png
[lineTypeEnd]: Assets/lineEnd.png
[lineTypeNone]: Assets/lineNone.png

[lineStyleLineWidth]: Assets/lineStyleWidth10.png
[lineStyleSpotDiameter]: Assets/lineStyleSpotDiameter12.png
[lineStyleSpotColor]: Assets/lineStyleSpotColor.png
[lineStyleLineColor]: Assets/lineStyleLineColor.png
[lineStyleOffsetY]: Assets/lineStyleOffsetY.png

[bubbleStyleDefault]: Assets/bubbleStyleDefault.png
[bubbleStyleWidth]: Assets/bubbleStyleWidth.png
[bubbleStyleBorderColor]: Assets/bubbleStyleBorderColor.png
[bubbleStyleBackgroundColor]: Assets/bubbleStyleBackgroundColor.png
[bubbleStyleArrowOffsetY]: Assets/bubbleStyleArrowOffset.png

<style>
table img {
  height: 100px;
  object-fit: contain;
}
</style>