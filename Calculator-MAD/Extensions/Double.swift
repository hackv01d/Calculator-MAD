//
//  Double.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

extension Double {
    var rightType: String {
        if floor(self) == self {
            return String(Int(self))
        } else {
            return String(self)
        }
    }
}
