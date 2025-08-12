//
//  DoctorDetailView.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//



import SwiftUI

struct DoctorDetailView: View {
    let doctor: Doctor
    let description: String
    @State private var showPrice = false
    
    init(doctor: Doctor, description: String? = nil) {
        self.doctor = doctor
        self.description = description ?? "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии."
    }
    var body: some View {
        ZStack {
            Color(.lightGrayBack)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Заголовок
                        Text(doctor.specialization.first?.name ?? "")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top)
                        
                        // Фото + Имя
                        HStack(spacing: 12) {

                            AvatarView(urlString: doctor.avatar)
                            
                            VStack(alignment: .leading) {
                                Text("\(doctor.last_name) \(doctor.first_name)")
                                    .font(.system(size: 16, weight: .semibold))
                                if let patronymic = doctor.patronymic, !patronymic.isEmpty {
                                    Text(patronymic)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                        }
                        .padding(.top, 8)
                        
                        // Инфо-блоки
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Опыт работы: \(doctor.seniority) лет", systemImage: "clock")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            Label(doctor.scientific_degree_label ?? "None", systemImage: "doc.text")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            Label(doctor.education_type_label?.name ?? "None", systemImage: "graduationcap")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            Label(doctor.work_expirience.first?.organization ?? "None", systemImage: "mappin.and.ellipse")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        // Стоимость услуг
                        Button {
                            showPrice = true
                        } label: {
                            HStack {
                                Text("Стоимость услуг")
                                    .font(.system(size: 16, weight: .semibold))
                                Spacer()
                                Text("от \(doctor.video_chat_price) ₽")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .buttonStyle(.plain)
                        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                        .navigationDestination(isPresented: $showPrice) {
                            PriceView(doctor: doctor)
                        }
                        
                        // Описание
                        Text(description)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .padding(.top, 4)
                        
                        Spacer(minLength: 100)
                    }
                    .padding()
                }
                
                // Кнопка "Записаться"
                VStack {
                    if !doctor.free_reception_time.isEmpty {
                        Button(action: {
                            print("Записаться")
                        }) {
                            Text("Записаться")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pinkBtn)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }
                    } else {
                        Text("Нет свободного расписания")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .navigationTitle(doctor.specialization.first?.name ?? doctor.first_name + " " + doctor.last_name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}
