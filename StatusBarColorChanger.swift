extension UIApplication {
	func setStatusBarColor(to color: UIColor) {
		guard let statusBar = self.value(forKey: "statusBar") as? UIView else { return }
		if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
			statusBar.backgroundColor = color
		}
	}
}


// Usage: UIApplication.shared.setStatusBarColor(to: color)
