//
//  Contact.swift
//  Exam-2054
//
//  Created by Candidate 2054
//

import Foundation

struct ContactsData: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    //let id: ID
    var name: Name
    var picture: Picture
    var dob: Dob
    let email: String
    let phone: String
    var location: Location
}
/*
struct ID: Codable {
    var value: String
}
 */

struct Name: Codable {
    var first: String
    var last: String
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct Location: Codable {
    var city: String
    var coordinates: Coordinates?
}

struct Coordinates: Codable {
    var latitude: String?
    var longitude: String?
}

struct Dob: Codable {
    var date: String
    var age: Int
}
