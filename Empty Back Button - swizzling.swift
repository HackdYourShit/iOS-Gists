import ObjectiveC

extension UIViewController {
	override open class func initialize() {
		var onceToken: Int = 0
		if (onceToken == 0) {
			/* TODO: move below code to a static variable initializer (dispatch_once is deprecated) */
			let `class`: AnyClass = UIViewController.self
			let originalSelector: Selector = #selector(self.viewDidLoad)
			let swizzledSelector: Selector = #selector(self.mob_viewDidLoad)
			let originalMethod = class_getInstanceMethod(`class`, originalSelector)
			let swizzledMethod = class_getInstanceMethod(`class`, swizzledSelector)
			let didAddMethod: Bool = class_addMethod(`class`, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
			if didAddMethod {
				class_replaceMethod(`class`, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
			}
			else {
				method_exchangeImplementations(originalMethod, swizzledMethod)
			}
		}
		onceToken = 1
	}
	
	// MARK: - Method Swizzling
	func mob_viewDidLoad() {
		mob_viewDidLoad()
		let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		navigationItem.backBarButtonItem = backButtonItem
	}
}