
extension Double {
    func rounded(toPlaces places:Int) -> String {
        let divisor = pow(10.0, Double(places))
        var returnValue = "\((self * divisor).rounded() / divisor)"
        if(returnValue.split(separator: ".")[1].count == 1 && places > 1) {
            returnValue += "0"
        }
        return returnValue
    }
}
//Use like this:
1.403843.rounded(toPlaces: 2) >> "1.40"
