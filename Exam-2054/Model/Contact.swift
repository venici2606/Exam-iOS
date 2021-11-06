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
    let name: Name
    let picture: Picture
    //let date: Dob
    //let age: Dob
    let email: String
    let phone: String
    //let city: Location
}

struct ContactInfo: Decodable {
    let name: Name
    let picture: Picture
    let date: Dob
    let age: Dob
    let email: String?
    let phone: String?
    let city: Location
}

struct Name: Decodable {
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Location: Decodable {
    let street: String?
    let city: String?
    let state: String?
    let postcode: Int?
    let coordinates: Coordinates
}

struct Coordinates: Decodable {
    let latitude: String?
    let longitude: String?
}

struct Dob: Decodable {
    let date: String?
    let age: Int?
}

