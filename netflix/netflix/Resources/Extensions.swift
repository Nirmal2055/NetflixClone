//
//  Extensions.swift
//  netflix
//
//  Created by Nirmal Koirala on 05/07/2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}
