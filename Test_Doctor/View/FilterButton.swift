//
//  FilterButton.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 10.08.2025.
//

import SwiftUI

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let isAscending: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text(title)
                if isSelected {
                    Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                        .font(.system(size: 10, weight: .bold))
                }
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(isSelected ? .white : .gray)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(isSelected ? Color.pinkBtn : Color.white)
        }
        .buttonStyle(.plain)
    }
}
