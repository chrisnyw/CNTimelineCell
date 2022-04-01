# CNTimelineCell

---

---
### Requirements
- iOS 10+
- Swift 5.3+
---
### Installation

#### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Gradient Progress Bar does support its use on supported platforms.

Once you have your Swift package set up, adding Gradient Progress Bar as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

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
  let dataItem: [TimelineItem] = [TimelineItem(title: "Good morning", content: "Today is sunny day!", image: UIImage(systemName: "sun.min")),
                                  TimelineItem(title: "08:00 am", content: "Tom wakes up", image: UIImage(systemName: "star.fill"), leftType: .start)]
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
    cell.setCellWithItem(timelineItem)
    return cell
  }
```

---
### Configuration
Will be provided soon

---
### Author
Chris Ng (chrisnyw@gmail.com)

---
### License
CNTimelineCell is available under the MIT license. See the LICENSE file for more info.
