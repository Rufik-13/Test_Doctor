//
//  DoctorViewModel.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//


import Foundation
import SwiftUI

final class DoctorsViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []

    
    @Published var searchText: String = ""
    @Published var selectedFilter: String = "По цене"
    @Published var isAscending: Bool = true

    let filters = ["По цене", "По стажу", "По рейтингу"]

    init() {
        loadDoctors()
    }

    func loadDoctors() {
        if let response = loadJSONFromBundle("test", as: DoctorsResponse.self) {
            self.doctors = response.data.users
        }
    }

    // Поиск
    var filteredDoctors: [Doctor] {
        guard !searchText.isEmpty else { return doctors }
        let q = searchText.lowercased()
        return doctors.filter {
            let fullName = "\($0.last_name) \($0.first_name) \($0.patronymic ?? "")".lowercased()
            return fullName.contains(q) ||
                   $0.specialization.contains { $0.name.lowercased().contains(q) }
        }
    }

    // Сортировка
    var sortedDoctors: [Doctor] {
        switch selectedFilter {
        case "По цене":
            return filteredDoctors.sorted {
                isAscending ? $0.video_chat_price < $1.video_chat_price
                            : $0.video_chat_price > $1.video_chat_price
            }
        case "По стажу":
            return filteredDoctors.sorted {
                isAscending ? $0.seniority < $1.seniority
                            : $0.seniority > $1.seniority
            }
        case "По рейтингу":
            return filteredDoctors.sorted {
                isAscending ? $0.ratings_rating < $1.ratings_rating
                            : $0.ratings_rating > $1.ratings_rating
            }
        default:
            return filteredDoctors
        }
    }

    // обработка по фильтру
    func tapFilter(_ filter: String) {
        if selectedFilter == filter {
            isAscending.toggle()
        } else {
            selectedFilter = filter
            isAscending = true
        }
    }
}
