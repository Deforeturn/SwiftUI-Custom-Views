//
//  CustomTabView.swift
//  CustomViews
//
//  Created by JiHoon K on 6/24/24.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                SearchView()
                    .tag(1)
                
                FavoriteView()
                    .tag(2)
                
                ProfileView()
                    .tag(3)
            }
            
            ZStack {
                HStack {
                    ForEach(TabItems.allCases, id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            tabBarItem(title: item.title, systemName: item.systemName, isSelected: selectedTab == item.rawValue)
                        }
                    }
                }
            }
            .background(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 55, style: .continuous))
            .padding(.horizontal, 25)
        }
    }
    
    init(selectedTab: Int = 0) {
        self.selectedTab = selectedTab
        
        UITabBar.appearance().backgroundColor = UIColor.clear
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
}

extension CustomTabView {
    private func tabBarItem(title: String, systemName: String, isSelected: Bool) -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: systemName)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .item : .item)
                
                if isSelected {
                    Text(title)
                        .font(.system(size: 12))
                        .foregroundColor(isSelected ? .item : .item)
                }
            }
            .padding(.vertical, 5)
            Spacer()
        }
        .frame(height: 55)
    }
}

#Preview {
    CustomTabView()
}
