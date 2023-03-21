//
//  DebugPrint.swift
//  Simple Sudoku
//
//  Created by Taylor Geisse on 3/7/23.
//

import Foundation

struct DebugUtil {
    #if DEBUG
    static private let queue = DispatchQueue(label: "personalRM.debugPrint")
    #endif
    
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n", function: String = #function) {
        #if DEBUG
            var itemsCopy = items
            queue.async {
                let date = Date()
                let calendar = Calendar.current
                let dateString = String(format: "%0.2d:%0.2d:%0.2d", calendar.component(.hour, from: date), calendar.component(.minute, from: date), calendar.component(.second, from: date))
                
                itemsCopy.insert("\(dateString) Mathdoku.\(function):\(separator != " " ? " " : "")", at: 0)
                
                var idx = itemsCopy.startIndex
                let endIdx = itemsCopy.endIndex
                
                repeat {
                    Swift.print("\(itemsCopy[idx])", separator: separator, terminator: (idx == (endIdx - 1) ? terminator : separator))
                    idx += 1
                } while idx < endIdx
            }
        #endif
    }
}
