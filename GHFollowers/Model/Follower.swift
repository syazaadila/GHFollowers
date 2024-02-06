//
//  Follower.swift
//  GHFollowers
//
//  Created by ansible on 26/01/2024.
//

import Foundation

//Adding Codable to the inheritance list for Followers triggers an automatic conformance that satisfies all of the protocol requirements from Encodable and Decodable:
struct Follower: Codable, Hashable{
    
    var login: String
    var avatarUrl: String
}
