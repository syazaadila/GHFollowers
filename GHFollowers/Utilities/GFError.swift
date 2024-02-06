//
//  GFError.swift
//  GHFollowers
//
//  Created by ansible on 31/01/2024.
//

import Foundation

//conforming to error protocol
enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. please try again"
    case alreadyInFavorites = "You've already favorited this user. You must REALLY LIKE THEM!"
}
