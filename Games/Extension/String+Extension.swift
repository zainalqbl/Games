//
//  String+Extension.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
