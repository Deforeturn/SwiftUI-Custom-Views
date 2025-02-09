//
//  TabItems.swift
//  CustomViews
//
//  Created by JiHoon K on 6/24/24.
//


enum TabItems: Int, CaseIterable {
    case home, search, favorite, profile
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .search:
            "Search"
        case .favorite:
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
        case .favorite:
            "heart"
        case .profile:
            "person.crop.circle"
        }
    }
}
