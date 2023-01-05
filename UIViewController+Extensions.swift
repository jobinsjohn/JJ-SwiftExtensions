extension UIViewController {
    func openMain() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController {
          viewController.modalPresentationStyle = .fullScreen
          self.present(viewController, animated: true, completion: nil)
     }
}
//Use like this:
someViewController.openMain()