//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by ansible on 31/01/2024.
//

import Foundation

extension Date {
//    func convertToMonthYearFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM yyy"
//        return dateFormatter.string(from: self)
//    }
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
    
}
