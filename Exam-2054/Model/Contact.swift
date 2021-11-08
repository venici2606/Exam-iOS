//
//  Contact.swift
//  Exam-2054
//
//  Created by Venicia Punithan on 06/11/2021.
//

import Foundation

struct ContactsData: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    var name: Name
    var picture: Picture
    var dob: Dob
    var email: String
    var phone: String
    var location: Location
}



struct Name: Decodable {
    var first: String
    var last: String
}

struct Picture: Decodable {
    var large: URL
    var medium: URL
    var thumbnail: URL
}

struct Location: Decodable {
    var city: String
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}

struct Dob: Decodable {
    var date: String
    var age: Int
}

