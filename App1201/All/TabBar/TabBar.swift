//
//  TabBar.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 15, height: 15)

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color.white : Color.gray)
//                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Car = "Car"
    
    case Expenses = "Expenses"
    
    case Settings = "Settings"

}
