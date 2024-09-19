//
//  EditProfileOption.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 11/2/2024.
//

import Foundation

enum EditProfileOptions: Hashable{
    case name
    case username
    
    var title: String{
        switch self{
        case .name:
            return "Name"
        case .username:
            return "Username"
        
        }
    }
}
