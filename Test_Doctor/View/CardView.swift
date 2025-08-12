//
//  CardView.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//

import SwiftUI

struct DoctorCard: View {
    let doctor: Doctor
    let onBook: () -> Void
    let onFavoriteChanged: (Bool) -> Void
    
    @State private var isFavorite = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                AvatarView(urlString: doctor.avatar)
                
                VStack(alignment: .leading, spacing: 4) {
                    // Имя
                    Text("\(doctor.last_name) \(doctor.first_name) \(doctor.patronymic ?? "")")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.bottom, 8)
                    
                    // Рейтинг
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(doctor.ratings_rating.rounded()) ? "star.fill" : "star")
                                .foregroundColor(index < Int(doctor.ratings_rating.rounded()) ? .pink : .gray)
                                .font(.system(size: 12))
                                .padding(.bottom, 8)
                        }
                    }
                    

                    // Специализация + стаж --> Все элементы
                    Text("\(doctor.specialization.map { $0.name }.joined(separator: ", ")) • стаж \(doctor.seniority) лет")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)

                    
                    // Цена
                    Text("от \(doctor.video_chat_price) ₽")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
                
                Spacer()
                
                Button {
                    isFavorite.toggle()
                    onFavoriteChanged(isFavorite)
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .pink : .gray)
                        .padding(8)
                }
                .buttonStyle(.plain)
            }
            
            // Кнопка
            if !doctor.free_reception_time.isEmpty {
                Button(action: { onBook() }) {
                    Text("Записаться")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pinkBtn)
                        .cornerRadius(8)
                }
            } else {
                Text("Нет свободного расписания")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}


