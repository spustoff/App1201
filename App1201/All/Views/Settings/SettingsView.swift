//
//  SettingsView.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Text("Rate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(7)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 18).fill(Color("prim")))
                            }
                            .padding(25)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/53d8e9f3-1033-4607-aa72-37b619a68a02") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "person.badge.shield.checkmark")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Text("Read")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(7)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 18).fill(Color("prim")))
                            }
                            .padding(25)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
