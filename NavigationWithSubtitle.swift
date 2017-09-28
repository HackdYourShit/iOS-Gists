@available(iOS 9.0, *)
extension UINavigationItem {
	func setTitle(title:String, subtitle:String) {

		let one = UILabel()
		one.text = title
		one.font = UIFont.systemFont(ofSize: 17)
		one.sizeToFit()

		let two = UILabel()
		two.text = subtitle
		two.font = UIFont.systemFont(ofSize: 12)
		two.textAlignment = .center
		two.sizeToFit()



		let stackView = UIStackView(arrangedSubviews: [one, two])
		stackView.distribution = .equalCentering
		stackView.axis = .vertical
		stackView.alignment = .center

		let width = max(one.frame.size.width, two.frame.size.width)
		stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35) 



		self.titleView = stackView
	}
}
