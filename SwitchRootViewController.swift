
extension UIWindow {

	/// Changes rootViewController to specified one.
	///
	/// - Parameters:
	///   - viewController: new rootViewController
	///   - animated: will switch have animation
	///   - duration: duration of animation
	///   - options: animation options
	///   - completion: completion callback when switch finished
	func switchRootViewController(_ viewController: UIViewController, animated: Bool = true, duration: TimeInterval = 0.5, options: UIViewAnimationOptions = .transitionFlipFromRight, completion: (() -> Void)? = nil) {
		removeAllSubviews()
		if animated {
			UIView.transition(with: self,
							  duration: duration,
							  options: options,
							  animations: {
								let oldState = UIView.areAnimationsEnabled
								UIView.setAnimationsEnabled(false)
								self.rootViewController = viewController
								UIView.setAnimationsEnabled(oldState) },
							  completion: { _ in completion?() }
			)
		} else {
			rootViewController = viewController
			completion?()
		}
	}
}

extension UIView {

    /// Removes all subviews from view
    func removeAllSubviews() {
		for view in self.subviews {
			view.removeFromSuperview()
		}
	}
}
