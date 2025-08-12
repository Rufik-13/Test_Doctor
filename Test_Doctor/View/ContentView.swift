//
//  ContentView.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State var page: String = ""
    
    var body: some View {
        TabView {
            
            Home()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            
            Text("Приемы")
                .tag("Reception")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Приемы")
                }
            
            Text("Чат")
                .tag("Chat")
                .tabItem {
                    Image(systemName: "message")
                    
                    Text("Чат")
                }
                .badge(1)
            
            Text("Профиль")
                .tag("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
            
        }
        
        .tint(.pink)
        
    }
    
}


#Preview {
    ContentView()
}





