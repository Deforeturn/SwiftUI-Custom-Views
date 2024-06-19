//
//  Ex+Animation.swift
//  CustomViews
//
//  Created by JiHoon K on 6/20/24.
//

import SwiftUI

extension Animation {
    static func aniCurve(_ duration:Double, _ delay:Double) -> Animation{
        return .timingCurve(0.25, 0.5, 0.15, 1.0, duration: duration).delay(delay)
    }
}
