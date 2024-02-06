//
//  User.swift
//  GHFollowers
//
//  Created by ansible on 26/01/2024.
//

import Foundation


//Adding Codable to the inheritance list for User triggers an automatic conformance that satisfies all of the protocol requirements from Encodable and Decodable:
//create network call
//take json and convert into object that u can use
struct User: Codable{
   let login: String
   let avatarUrl: String //camelCase conversion from snakeCase
   var name: String?
   var location: String?
   var bio: String?
   let publicRepos: Int
   let publicGists: Int
   let htmlUrl: String
   let following: Int
   let followers: Int
   let createdAt: Date
}
