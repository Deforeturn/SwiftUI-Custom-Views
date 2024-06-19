//
//  Ex+BinaryFloatingPoint.swift
//  CustomViews
//
//  Created by JiHoon K on 6/20/24.
//

import Foundation

extension BinaryFloatingPoint {
    func formatToDecimalString(_ decimalPoint: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = decimalPoint
        numberFormatter.numberStyle = .decimal
        
        guard let formattedString = numberFormatter.string(for: self) else {
            return ""
        }
        
        return formattedString
    }
}
