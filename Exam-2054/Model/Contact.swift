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
    //var date: Dob
    //var age: Dob
    var email: String
    var phone: String
    //var city: Location
}

/*
struct ContactInfo: Decodable {
    var name: Name
    var picture: Picture
    var date: Dob
    var age: Dob
    var email: String
    var phone: String
    var city: Location
}*/

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
    var street: String
    var city: String
    var state: String
    var postcode: Int
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}

struct Dob: Decodable {
    var date: String?
    var age: Int?
}

