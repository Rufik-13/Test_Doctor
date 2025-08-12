//
//  HomeView.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 10.08.2025.
//

import SwiftUI

struct Home: View {
    @State private var selectedDoctor: Doctor?
    @StateObject private var viewModel = DoctorsViewModel()
 
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(.lightGrayBack)
                    .ignoresSafeArea(edges: .top)
                
                VStack {
                    Text("Педиатры")
                        .font(.headline)
                    
                    // MARK: Search
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Поиск", text: $viewModel.searchText)

                    }
                    .padding(10)
                    .background(Color(.white))
                    .cornerRadius(8)
                    .padding(.bottom, 16)
                    
                    // MARK: Filter
                    
                    HStack(spacing: 0) {
                        ForEach(viewModel.filters.indices, id: \.self) { index in
                            let filter = viewModel.filters[index]

                            FilterButton(
                                title: filter,
                                isSelected: viewModel.selectedFilter == filter,
                                isAscending: viewModel.isAscending,
                                action: { viewModel.tapFilter(filter) }
                            )
                            .frame(maxWidth: .infinity)
                            .background(viewModel.selectedFilter == filter ? Color.pink : Color.white)
                            .foregroundColor(viewModel.selectedFilter == filter ? .white : .gray)

                            if index < viewModel.filters.count - 1 {
                                Divider().frame(width: 1, height: 24).background(Color.white)
                            }
                        }
                    }
                    .cornerRadius(8)
                    .padding(2)
                    .padding(.bottom, 24)


                    // MARK: Doctor Card
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.sortedDoctors) { doctor in
                                Button {
                                    selectedDoctor = doctor
                                } label: {
                                    DoctorCard(
                                        doctor: doctor,
                                        onBook: { selectedDoctor = doctor },
                                        onFavoriteChanged: { isFav in
                                            print("\(doctor.id) в избранных: \(isFav)")
                                        }
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(16)
            }

            .navigationDestination(item: $selectedDoctor) { doctor in
                DoctorDetailView(doctor: doctor)
            }
        }
    }
    
}


#Preview {
    Home()
}
