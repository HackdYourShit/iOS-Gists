import Foundation

extension UIApplication {	
	/// Checks if view hierarchy of application contains `UIRemoteKeyboardWindow` if it does, keyboard is presented
	var isKeyboardPresented: Bool {
		if let keyboardWindowClass = NSClassFromString("UIRemoteKeyboardWindow"), self.windows.contains(where: { $0.isKind(of: keyboardWindowClass) }) {
			NSLog("UIApplication windows contains UIRemoteKeyboardWindow - keyboard is presented")
			return true
		} else {
			NSLog("UIApplication windows does not contains UIRemoteKeyboardWindow - keyboard is not presented")
			return false
		}
	}
}
