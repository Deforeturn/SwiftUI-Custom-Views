//
//  HomeView.swift
//  CustomViews
//
//  Created by JiHoon K on 6/24/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List(0..<50) { _ in
            Text("Home")
        }
        
    }
}

struct SearchView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { _ in
                Text("Search")
            }
        }
    }
}

struct FavoriteView: View {
    var body: some View {
        Text("Favorite")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
    }
}

#Preview {
    HomeView()
}
