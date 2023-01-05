extension UIView {
    func dropShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor 
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 5
    }
}