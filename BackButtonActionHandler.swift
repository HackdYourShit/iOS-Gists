/// Handle UINavigationBar's 'Back' button action
protocol  UINavigationBarBackButtonHandler {

	/// Flag to indicate if 'Back' button action will be executed, by default this function returns true which is default behaviour.
	/// Override this function in the specified viewcontroller where back should be intercepted.
	///
	/// - Returns: true - if back is blocked，false - if not
	func  shouldPopOnBackButton() -> Bool
}

extension UIViewController: UINavigationBarBackButtonHandler {
	/// Flag to indicate if 'Back' button action will be executed, by default this function returns true which is default behaviour.
	/// Override this function in the specified viewcontroller where back should be intercepted.
	///
	/// - Returns: true - if back is blocked，false - if not
	@objc func  shouldPopOnBackButton() -> Bool {
		return true
	}
}

extension UINavigationController: UINavigationBarDelegate {

	// Used in this case to check if tapping on back button should close view controller or not.
	public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
		guard let items = navigationBar.items else {
			return false
		}

		if viewControllers.count < items.count {
			return true
		}

		var shouldPop = true
		if let vc = topViewController, vc.responds(to: #selector(UIViewController.shouldPopOnBackButton)) {
			shouldPop = vc.shouldPopOnBackButton()
		}

		if shouldPop {
			DispatchQueue.main.async {
				self.popViewController(animated: true)
			}
		}

		return false
	}
}

extension UIGestureRecognizer {

	/// Cancels UIGestureRecognizer
	func cancel() {
		isEnabled = false
		isEnabled = true
	}
}


// To override swipe to go back just add target to it -	self.navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleSwipeToGoBack(_:)))
// In function just see if it began then you can do something to it
// @objc func handleSwipeToGoBack(_ recognizer: UIGestureRecognizer) {
//		switch recognizer.state {
//		case .began:
//			//Do something instead of go back if you want to stop it just call recognizer.cancel()
//		default:
//			return
//		}
//	}

