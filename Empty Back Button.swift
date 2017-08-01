 extension UIViewController {
    /// Sets bar button title to empty string
    /// - note: this will remove any action that's made in code for back button on `UIViewController`
    func setBackButtonTitleToEmpty() {
        if let item = self.navigationController?.navigationBar.topItem {
            // self.navigationController.navigationBar.topItem contains title of previos viewController, if that title is changed previous view controller title will change too
            item.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        } else {
            guard let backItem = self.navigationController?.navigationBar.backItem else { return }
            backItem.title = title
        }
    }
}