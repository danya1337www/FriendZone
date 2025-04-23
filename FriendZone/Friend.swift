//
//  Friend.swift
//  FriendZone
//
//  Created by Danil Chekantsev on 23.04.2025.
//

import Foundation

struct Friend: Codable {
    var name: String = "New Friend"
    var timeZone: TimeZone = TimeZone.current
}
