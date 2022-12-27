
import SwiftUI

//MARK: - String
extension String{
    static let urlCar = "https://images.ctfassets.net/yadj1kx9rmg0/wtrHxeu3zEoEce2MokCSi/cf6f68efdcf625fdc060607df0f3baef/quwowooybuqbl6ntboz3.jpg"
}

//MARK: - Animation
extension Animation{
    
    static func aniCurve(_ duration:Double, _ delay:Double) -> Animation{
        return .timingCurve(0.25, 0.5, 0.15, 1.0, duration: duration).delay(delay)
    }
}
