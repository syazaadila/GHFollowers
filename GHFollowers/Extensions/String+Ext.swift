//
//  String+Ext.swift
//  GHFollowers
//
//  Created by ansible on 31/01/2024.
//

import Foundation

extension String{
    
    func convertToDisplayFormat() -> String{
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
