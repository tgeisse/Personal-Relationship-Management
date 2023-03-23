//
//  DateFormats.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import Foundation

enum DateFormat: String, CaseIterable {
    case weekdayAbbreviated     = "EEE"
    case weekday                = "EEEE"
    case shortDate              = "yyyy-MM-dd"
    case monthDay               = "MM/dd"
    case usStandard             = "MM/dd/yyyy"
    case internationalStandard  = "dd/MM/yyyy"
    case iso8601UTC             = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case iso8601                = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}
