//
//  CardModel.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//


import Foundation

struct DoctorsResponse: Codable {
    let data: DoctorsData
}

struct DoctorsData: Codable {
    let users: [Doctor]
}

struct Doctor: Identifiable, Codable, Hashable {
    let id: String
    let first_name: String
    let patronymic: String?
    let last_name: String
    let ratings_rating: Double
    let specialization: [Specialization]
    let seniority: Int
    let video_chat_price: Int
    let text_chat_price: Int
    let hospital_price: Int
    let avatar: String?
    let free_reception_time: [ReceptionTime]
    let scientific_degree_label: String?
    let education_type_label: Education?
    let work_expirience: [WorkExpirience]
    
}

struct Specialization: Codable, Hashable  {
    let id: Int
    let name: String
}

struct ReceptionTime: Codable, Hashable  {
    let time: Int
}

struct Education: Codable, Hashable  {
    let name: String?
    
}

struct WorkExpirience: Codable, Hashable  {
    let organization: String?
}
