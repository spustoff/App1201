//
//  U1.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 17) {
                    
                    Text("Manage your vehicles")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("track expenses, and store dream car details in one place")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.top, 60)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    U1()
}
