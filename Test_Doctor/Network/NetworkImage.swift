//
//  NetworkImage.swift
//  Test_Doctor
//
//  Created by Ruslan  on 10.08.2025.
//


import SwiftUI
import SDWebImageSwiftUI

struct AvatarView: View {
    let urlString: String?
    
    var body: some View {
        if let s = urlString, let url = URL(string: s) {
            WebImage(url: url, options: [.retryFailed, .scaleDownLargeImages])
                .resizable()
                .scaledToFill()
                .transition(.fade(duration: 0.2))
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
                .clipShape(Circle())
        }
    }
}

