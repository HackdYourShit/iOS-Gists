extension UITableViewCell {
	func removeSeparators() {
		for subview in self.subviews where NSStringFromClass(subview.classForCoder) == "_UITableViewCellSeparatorView" {
			subview.removeFromSuperview()
		}
	}
}

// Then in cell subclass
class MyCell: UITableViewCell {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.removeSeparators()
  }
}
