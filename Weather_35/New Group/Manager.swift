//
//  Manager.swift
//  Weather_35
//
//  Created by cmStudent on 2022/01/06.
//

import SwiftUI

struct Manager {
    static func text(from url: URL) -> String {
        guard let data = try? Data(contentsOf: url) else {
            return "error"
        }
        
        return String(data: data, encoding: .ascii) ?? "error"
    }
}
