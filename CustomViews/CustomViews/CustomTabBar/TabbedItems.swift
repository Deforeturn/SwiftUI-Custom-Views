//
//  TabbedItems.swift
//  CustomViews
//
//  Created by JiHoon K on 6/24/24.
//


enum TabbedItems: Int, CaseIterable {
    case home, search, Favorite, profile
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .search:
            "Search"
        case .Favorite:
            "Favorite"
        case .profile:
            "Profile"
        }
    }
    
    var systemName: String {
        switch self {
        case .home:
            "house"
        case .search:
            "magnifyingglass"
        case .Favorite:
            "heart"
        case .profile:
            "person.crop.circle"
        }
    }
}
