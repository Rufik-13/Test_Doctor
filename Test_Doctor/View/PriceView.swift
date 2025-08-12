//
//  PriceView.swift
//  Test_Doctor
//
//  Created by Ruslan on 06.08.2025.
//


import SwiftUI

struct PriceView: View {
    let doctor: Doctor
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Видеоконсультация
                Text("Видеоконсультация")
                    .font(.headline)
                
                HStack {
                    Text("30 мин")
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(doctor.video_chat_price) ₽")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                // Чат с врачом
                Text("Чат с врачом")
                    .font(.headline)
                
                HStack {
                    Text("30 мин")
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(doctor.text_chat_price) ₽")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                // Приём в клинике
                Text("Приём в клинике")
                    .font(.headline)
                
                HStack {
                    Text("В клинике")
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(doctor.hospital_price) ₽")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                Spacer()
            }
            .padding()
        }
        .background(Color(.lightGrayBack))
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
    }
}
